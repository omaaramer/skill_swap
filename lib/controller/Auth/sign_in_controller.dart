import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class SignInController extends GetxController {
  signIn();
  goToSignUpScreen();
  goToForgetPasswordScreen();
}

class MySignInControllerImpl extends SignInController {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isObscureText = true;
  @override
  signIn() {
    var formDate = formKey.currentState;
    if (formDate!.validate()) {
      Get.offNamed(Routes.verifyScreen);
    } else {}
  }

  @override
  goToSignUpScreen() {
    Get.offNamed(Routes.signUpScreen);
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

  showPassword() {
    isObscureText = !isObscureText;
    update();
  }
}
