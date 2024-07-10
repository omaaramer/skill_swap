import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToSuccessSignUpScreen();
}

class CheckEmailControllerImpl extends CheckEmailController {
  late TextEditingController email;

  @override
  goToSuccessSignUpScreen() {
    Get.offNamed(Routes.successSignUpScreen);
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
