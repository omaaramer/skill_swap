import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/sign_up_controller.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';
import 'package:skill_swap/view/auth/widgets/have_acount_text_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImpl signUpController = Get.put(SignUpControllerImpl());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              Text("Create account", style: AppStyle.styleBold30(context)),
              const Text(
                  "Create an account and enjoy a world of learning and connections."),
              const SizedBox(height: 40),
              AppTextFormField(
                  controller: signUpController.username,
                  suffixIcon: const Icon(Icons.person_outline),
                  hintText: "Enter your Username",
                  validator: (value) {}),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              AppTextFormField(
                  controller: signUpController.phone,
                  suffixIcon: const Icon(Icons.phone),
                  hintText: "Phone",
                  validator: (value) {}),
              const SizedBox(height: 10),
              AppTextFormField(
                  controller: signUpController.email,
                  suffixIcon: const Icon(Icons.email_outlined),
                  hintText: "Email",
                  validator: (value) {}),
              const SizedBox(height: 10),
              AppTextFormField(
                  controller: signUpController.password,
                  suffixIcon: const Icon(Icons.lock_outline),
                  hintText: "Password",
                  validator: (value) {}),
              const SizedBox(height: 10),
              AppTextButton(
                  buttonText: "Create Account",
                  verticalPadding: 10,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  onPressed: () {}),
              const SizedBox(height: 20),
              HaveAcountWidget(
                text: "Have an account?",
                textButton: "Sign In",
                onPressed: () {
                  Get.offAllNamed(Routes.signInScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
