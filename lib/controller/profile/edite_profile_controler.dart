import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Add Skills/get_user_controller.dart';

abstract class EditProfileController extends GetxController {
  toggleEditingName();
  toggleEditingBio();
  saveName(String value);
  saveBio(String value);
}

class EditProfileControllerImpl extends EditProfileController {
  var isEditingName = false.obs;
  var isEditingBio = false.obs;
  GetUserControllerImpl userController = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void onInit() {
    nameController.text = userController.user!.fullname;
    bioController.text = userController.user!.jopTitle;
    super.onInit();
  }

  @override
  dispose() {
    nameController.dispose();
    bioController.dispose();
    super.dispose();
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
}
