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

abstract class ProfileController extends GetxController {
  getImageFromGallery();
  addUserData();
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
  DateTime birthDate = DateTime.now();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

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
      users.add({
        AppConstant.kFullname: name.text,
        AppConstant.kAddress: address.text,
        AppConstant.kPhone: phone.text,
        AppConstant.kEmail: email.text,
        AppConstant.kBirthDate: birthDate,
        AppConstant.kId: FirebaseAuth.instance.currentUser!.uid,
        AppConstant.kProfileImageUrl: url ?? "none",
      }).then((value) {
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
    email.dispose();
    name.dispose();
    address.dispose();
    phone.dispose();
    super.dispose();
  }
}
