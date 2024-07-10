import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController {
  signIn();
  goToSignUpScreen();
}

class SignInControllerImpl extends SignInController {
  late TextEditingController email;
  late TextEditingController password;
  @override
  signIn() {}

  @override
  goToSignUpScreen() {}

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
}
