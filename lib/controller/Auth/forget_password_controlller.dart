import 'package:firebase_auth/firebase_auth.dart';
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
    // Get.offNamed(Routes.signInScreen);
  }

  @override
  checkEmail() {
    if (email.text.trim().isEmpty) {
      Get.defaultDialog(
        title: 'Warning',
        middleText: 'Please enter your email.',
      );
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.trim());
      Get.offNamed(Routes.successResetPasswordScreen);
      Get.defaultDialog(
        title: 'Success',
        middleText: 'Please check your email to reset your password.',
      );
    }
  }

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
