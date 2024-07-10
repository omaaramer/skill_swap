import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class ResetPasswordController extends GetxController {
  checkPassword();
  goToSginInScreen();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController passWord;

  @override
  goToSginInScreen() {
    Get.offNamed(Routes.signInScreen);
  }

  @override
  checkPassword() {}

  @override
  void onInit() {
    passWord = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    passWord.dispose();
    super.dispose();
  }
}
