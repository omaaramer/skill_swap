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
  late TextEditingController aboutController;
  late TextEditingController nameController;
  late TextEditingController bioController;

  final DocumentReference usersRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers with user's current data
    final user = userController.user.value!;
    nameController = TextEditingController(text: user.fullname);
    bioController = TextEditingController(text: user.bio ?? '');
    aboutController = TextEditingController(text: user.aboutMe ?? '');
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

      if (nameController.text.trim() != userController.user.value!.fullname) {
        updates[AppConstant.kFullname] = nameController.text.trim();
      }
      if (bioController.text.trim() != userController.user.value!.bio) {
        updates[AppConstant.kBio] = bioController.text.trim();
      }
      if (aboutController.text.trim() !=
          (userController.user.value!.aboutMe ?? '')) {
        updates[AppConstant.kAboutMe] = aboutController.text.trim();
      }

      // Update only if there are changes
      if (updates.isNotEmpty) {
        await usersRef.update(updates);

        // Update local user object using copyWith
        userController.user.value = userController.user.value!.copyWith(
          fullname: updates[AppConstant.kFullname],
          bio: updates[AppConstant.kBio],
          aboutMe: updates[AppConstant.kAboutMe],
        );

        log('Fields updated successfully: ${updates.keys}');
      } else {
        log('No changes detected, nothing to update.');
      }
    } catch (e) {
      log('Error updating document: $e');
      Get.snackbar('Error', 'Failed to update profile info. Please try again.');
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
    nameController.text = value.trim();
    toggleEditingName();
  }

  @override
  void saveBio(String value) {
    bioController.text = value.trim();
    toggleEditingBio();
  }

  void saveAbout(String value) {
    aboutController.text = value.trim();
    isEditingAbout.value = false;
  }
}
