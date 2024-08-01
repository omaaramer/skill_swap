import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/data/models/user_model.dart';

abstract class ProfileController extends GetxController {
  getImageFromGallery();
  addUserData();
  updateBirthDate(DateTime newDateTime);
}

class ProfileControllerImpl extends ProfileController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController jopTitle = TextEditingController();
  TextEditingController phone = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  File? _image;
  String? url;
  DateTime birthDate = DateTime.now();
  DocumentReference users = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  @override
  Future<void> getImageFromGallery() async {
    try {
      XFile? imageFromGallery =
          await _picker.pickImage(source: ImageSource.gallery);

      if (imageFromGallery == null) return;

      _image = File(imageFromGallery.path);
      var imageName = basename(imageFromGallery.path);
      var refStorage = FirebaseStorage.instance
          .ref("${AppConstant.kCloudStorageProfileImages}/$imageName");

      await refStorage.putFile(_image!);
      url = await refStorage.getDownloadURL();
      update();
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Failed to upload image. Please try again.",
      );
    }
  }

  @override
  addUserData() {
    if (url != null) {
      final UserModel user = UserModel(
        fullname: name.text,
        address: address.text,
        // phone: phone.text,
        jopTitle: jopTitle.text,
        userId: FirebaseAuth.instance.currentUser!.uid,
        profileImageUrl: url ?? "none",
      );

      users.set(user.toMap()).then((value) {
        Get.offNamed(Routes.homePage);
      }).catchError((error) {
        Get.snackbar(
          "Warning",
          "Failed to add user: $error",
          duration: const Duration(seconds: 3),
        );
      });
    } else {
      Get.snackbar(
        "Error",
        "Please provide a skill image",
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  updateBirthDate(DateTime newDateTime) {
    birthDate = newDateTime;
    update();
  }

  @override
  void dispose() {
    jopTitle.dispose();
    name.dispose();
    address.dispose();
    phone.dispose();
    super.dispose();
  }
}
