import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToVerifyCodeSignUpScreen();
}

class CheckEmailControllerImpl extends CheckEmailController {
  late TextEditingController email;

  @override
  goToVerifyCodeSignUpScreen() {
    Get.offNamed(Routes.verifyCodeSignUpScreen);
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
