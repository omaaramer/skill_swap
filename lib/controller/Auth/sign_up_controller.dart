import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignInScreen();
}

class SignUpControllerImpl extends SignUpController {
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;
  @override
  goToSignInScreen() {
    Get.toNamed(Routes.signInScreen);
  }

  @override
  signUp() {
    throw UnimplementedError();
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
}
