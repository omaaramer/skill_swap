import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignInScreen();
}

class SignUpControllerImpl extends SignUpController {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;
  bool isObscureText = true;
  @override
  goToSignInScreen() {
    Get.offNamed(Routes.signInScreen);
  }

  @override
  signUp() {
    var formDate = formKey.currentState;
    if (formDate!.validate()) {
      Get.toNamed(Routes.verifyCodeSignUpScreen);
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  showPassword() {
    isObscureText = !isObscureText;
    update();
  }
}
