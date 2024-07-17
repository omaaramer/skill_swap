import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class SignInController extends GetxController {
  void signIn();
  void goToSignUpScreen();
  void goToForgetPasswordScreen();
}

class SignInControllerImpl extends SignInController {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  bool isObscureText = true;

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text
              .trim(), // Trim to remove any leading/trailing whitespace
          password: password.text,
        );
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          Get.offNamed(Routes.homePage);
        } else {
          showWarningDialog('Please verify your email address.');
          print('========================= Please verify your email address.');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showWarningDialog('No user found for that email.');
          print(
              '==================================== > No user found for that email.');
        } else if (e.code == 'wrong-password') {
          showWarningDialog('Wrong password provided for that user.');
        }
      } catch (e) {
        showWarningDialog('Something went wrong.');
        print(e);
      }
    }
  }

  void showWarningDialog(String message) {
    Get.defaultDialog(
      title: 'Warning',
      middleText: message,
    );
  }

  @override
  void goToSignUpScreen() {
    Get.offNamed(Routes.signUpScreen);
  }

  @override
  void goToForgetPasswordScreen() {
    Get.toNamed(Routes.forgetPasswordScreen);
  }

  void showPassword() {
    isObscureText = !isObscureText;
    update();
  }
}
