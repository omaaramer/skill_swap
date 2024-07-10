import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class SignInController extends GetxController {
  signIn();
  goToSignUpScreen();
  goToForgetPasswordScreen();
}

class SignInControllerImpl extends SignInController {
  late TextEditingController email;
  late TextEditingController password;
  @override
  signIn() {}

  @override
  goToSignUpScreen() {
    Get.toNamed(Routes.signUpScreen);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPasswordScreen() {
    Get.toNamed(Routes.forgetPasswordScreen);
  }
}
