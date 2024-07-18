import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileController extends GetxController {
  getImageFromGallery();
  addUserData();
}

class ProfileControllerImpl extends ProfileController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  File? _image;
  String? url;

  @override
  Future<void> getImageFromGallery() async {
    try {
      // Pick image from gallery
      XFile? imageFromGallery =
          await _picker.pickImage(source: ImageSource.gallery);

      if (imageFromGallery == null) return;

      // Convert XFile to File
      _image = File(imageFromGallery.path);

      // Get image name
      var imageName = basename(imageFromGallery.path);

      // Reference to Firebase Storage
      var refStorage = FirebaseStorage.instance.ref("profileImages/$imageName");

      // Upload the image
      await refStorage.putFile(_image!);

      // Get download URL
      url = await refStorage.getDownloadURL();

      // Update the UI or state
      update();
      print("Image URL: $url");
    } catch (e) {
      // Handle errors
      print("An error occurred: $e");
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  addUserData() {
    // Call the user's CollectionReference to add a new user
    if (formKey.currentState!.validate()) {
      return users
          .add({
            'full_name': name.text,
            'address': address.text,
            'phone': phone.text,
            'email': email.text,
            "id": FirebaseAuth.instance.currentUser!.uid,
            'url': url ?? "none",
            "time": DateTime.now(),
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } else {
      Get.defaultDialog(
        title: 'Warning',
        middleText: 'Please fill all the fields',
      );
    }
  }

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    address.dispose();
    phone.dispose();

    super.dispose();
  }
}
