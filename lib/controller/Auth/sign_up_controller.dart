import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';

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
  signUp() async {
    var formDate = formKey.currentState;
    if (formDate!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        Get.toNamed(Routes.signInScreen);
        Get.defaultDialog(
          title: 'Success',
          middleText: 'Please verify your email address.',
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.defaultDialog(
            title: 'Warning',
            middleText: 'The password provided is too weak.',
          );
        } else if (e.code == 'email-already-in-use') {
          Get.defaultDialog(
            title: 'Warning',
            titleStyle: TextStyle(color: Colors.red),
            middleText: 'The account already exists for that email.',
          );
        }
      } catch (e) {
        Get.defaultDialog(
          title: 'Warning',
          middleText: 'Something went wrong.',
        );
        print(e);
      }
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
