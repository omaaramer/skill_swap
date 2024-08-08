import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/routing/routes.dart';

import 'get_skill_post_data_controller.dart';

abstract class AddSkillController extends GetxController {
  addSkill();
  clearTextInput();
  getImageFromGallery();
  checkIfUserInfoExist();
}

class AddSkillControllerImpl extends AddSkillController {
  TextEditingController mySkill = TextEditingController();
  TextEditingController skillOfferedDescription = TextEditingController();
  TextEditingController skillNeeded = TextEditingController();
  TextEditingController skillRequestedDescription = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GetSkillPostDataControllerImpl getSkillPostDataController =
      Get.put(GetSkillPostDataControllerImpl());
  String? url;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool isOnline = true;

  @override
  void checkIfUserInfoExist() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('users').get();

      bool userExists = false;
      for (var doc in snapshot.docs) {
        if (FirebaseAuth.instance.currentUser?.uid == doc[AppConstant.kId]) {
          userExists = true;
          addSkill();
          break;
        }
      }

      if (!userExists) {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Please add user info first",
          onConfirm: () {
            Get.back();

            Get.offAllNamed(Routes.editProfile);
          },
          onCancel: () => Get.back(),
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    }
  }

  @override
  addSkill() async {
    if (formKey.currentState!.validate()) {
      if (url == null) {
        Get.snackbar(
          "Error",
          "Please provide a skill image",
          duration: const Duration(seconds: 3),
        );
        return;
      }

      CollectionReference skills =
          FirebaseFirestore.instance.collection('skills');

      await skills.add({
        AppConstant.kIsOnline: isOnline ? "ONLINE" : "IN PERSON",
        AppConstant.kMySkill: mySkill.text,
        AppConstant.kSkillNeeded: skillNeeded.text,
        AppConstant.kId: FirebaseAuth.instance.currentUser!.uid,
        AppConstant.kSkillImageUrl: url,
        AppConstant.kTime: DateTime.now(),
      }).then((value) {
        getSkillPostDataController.fetchPosts();
        Get.toNamed(Routes.homePage);
      }).catchError((error) {
        Get.snackbar(
          "Error",
          "Failed to add Skill: $error",
          duration: const Duration(seconds: 3),
        );
      });
      // i am invoking this function here to clear the text fields only if the skill added successfully
      clearTextInput();
    } else {
      Get.snackbar(
        "Error",
        "Please fill in all required fields",
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  clearTextInput() {
    mySkill.clear();
    skillOfferedDescription.clear();
    skillNeeded.clear();
    url = null;
    _image = null;
    skillRequestedDescription.clear();
  }

  @override
  Future<void> getImageFromGallery() async {
    try {
      XFile? imageFromGallery =
          await _picker.pickImage(source: ImageSource.gallery);

      if (imageFromGallery == null) return;

      _image = File(imageFromGallery.path);

      var imageName = basename(imageFromGallery.path);

      var refStorage = FirebaseStorage.instance
          .ref("$AppConstant.kCloudStorageSkillImages/$imageName");

      await refStorage.putFile(_image!);

      url = await refStorage.getDownloadURL();

      update();
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Something went wrong, Please try again",
      );
    }
  }

  @override
  void dispose() {
    mySkill.dispose();
    skillOfferedDescription.dispose();
    skillNeeded.dispose();
    url = null;
    _image = null;
    skillRequestedDescription.dispose();

    super.dispose();
  }
}
