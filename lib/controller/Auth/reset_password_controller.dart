import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class ResetPasswordController extends GetxController {
  checkPassword();
  goToScussessResetScreen();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController passWord;
  late TextEditingController confirmPassWord;

  @override
  goToScussessResetScreen() {
    Get.offNamed(Routes.successResetPasswordScreen);
  }

  @override
  checkPassword() {}

  @override
  void onInit() {
    passWord = TextEditingController();
    confirmPassWord = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    passWord.dispose();
    confirmPassWord.dispose();
    super.dispose();
  }
}
