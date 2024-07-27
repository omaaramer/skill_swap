import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_swap/constant.dart';

abstract class ProfileController extends GetxController {
  getImageFromGallery();
  addUserData();
  // clearTextInput();
  updateBirthDate(DateTime newDateTime);
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
      var refStorage = FirebaseStorage.instance
          .ref("$AppConstant.kCloudStorageProfileImages/$imageName");

      // Upload the image
      await refStorage.putFile(_image!);

      // Get download URL
      url = await refStorage.getDownloadURL();

      // Update the UI or state
      update();
    } catch (e) {
      // Handle errors
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  addUserData() {
    // Call the user's CollectionReference to add a new user

    return users
        .add({
          AppConstant.kFullname: name.text,
          AppConstant.kAddress: address.text,
          AppConstant.kPhone: phone.text,
          AppConstant.kEmail: email.text,
          AppConstant.kBirthDate: birthDate,
          AppConstant.kId: FirebaseAuth.instance.currentUser!.uid,
          AppConstant.kProfileImageUrl: url ?? "none",
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  DateTime birthDate = DateTime.now();

  @override
  updateBirthDate(DateTime newDateTime) {
    birthDate = newDateTime;
    update();
  }

  // @override
  // clearTextInput() {
  //   email.clear();
  //   name.clear();
  //   address.clear();
  //   phone.clear();
  // }

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    address.dispose();
    phone.dispose();
    super.dispose();
  }
}
