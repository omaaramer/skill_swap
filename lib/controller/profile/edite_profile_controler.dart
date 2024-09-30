import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Add Skills/get_user_controller.dart';

abstract class EditProfileController extends GetxController {}

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

  void toggleEditingName() {
    isEditingName.value = !isEditingName.value;
  }

  void toggleEditingBio() {
    isEditingBio.value = !isEditingBio.value;
  }

  void saveName(String value) {
    nameController.text = value;
    toggleEditingName();
  }

  void saveBio(String value) {
    bioController.text = value;
    toggleEditingBio();
  }
}
