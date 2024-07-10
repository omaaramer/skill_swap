import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerifyScreen();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController email;

  @override
  goToVerifyScreen() {
    Get.offNamed(Routes.verifyScreen);
  }

  @override
  checkEmail() {}

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
