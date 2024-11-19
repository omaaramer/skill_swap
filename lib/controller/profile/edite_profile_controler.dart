import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../Add Skills/get_user_controller.dart';

abstract class EditProfileController extends GetxController {
  Future<void> updateAboutMeInfo();
  void toggleEditingName();
  void toggleEditingBio();
  void saveName(String value);
  void saveBio(String value);
}

class EditProfileControllerImpl extends EditProfileController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isEditingName = false.obs;
  var isEditingBio = false.obs;
  var isEditingAbout = false.obs;

  final GetUserControllerImpl userController = Get.find();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  final DocumentReference usersRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  void onInit() {
    super.onInit();
    nameController.text = userController.user.value!.fullname;
    bioController.text = userController.user.value!.jopTitle;
    // Initialize `aboutController` if necessary
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    aboutController.dispose();
    super.dispose();
  }

  @override
  Future<void> updateAboutMeInfo() async {
    try {
      // Prepare the fields to be updated only if they have changed
      Map<String, String> updates = {};

      if (nameController.text != userController.user.value!.fullname) {
        updates[AppConstant.kFullname] = nameController.text;
      }
      if (bioController.text != userController.user.value!.jopTitle) {
        updates[AppConstant.kBio] = bioController.text;
      }
      if (aboutController.text.isNotEmpty &&
          aboutController.text != (userController.user.value!.aboutMe ?? '')) {
        updates[AppConstant.kAboutMe] = aboutController.text;
      }

      // Update only if there are changes
      if (updates.isNotEmpty) {
        await usersRef.update(updates);
        log('Fields updated successfully: ${updates.keys}');
      } else {
        log('No changes detected, nothing to update.');
      }
    } catch (e) {
      log('Error updating document: $e');
    }
  }

  @override
  void toggleEditingName() {
    isEditingName.value = !isEditingName.value;
  }

  @override
  void toggleEditingBio() {
    isEditingBio.value = !isEditingBio.value;
  }

  @override
  void saveName(String value) {
    nameController.text = value;
    toggleEditingName();
  }

  @override
  void saveBio(String value) {
    bioController.text = value;
    toggleEditingBio();
  }

  void saveAbout(String value) {
    aboutController.text = value;
  }
}
