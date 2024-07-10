import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/forget_password_controlller.dart';
import 'package:skill_swap/controller/Auth/reset_password_controller.dart';
import 'package:skill_swap/controller/Auth/sign_up_controller.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';
import 'package:skill_swap/view/auth/widgets/have_acount_text_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImpl resetPasswordController =
        Get.put(ResetPasswordControllerImpl());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text("Reset Password", style: AppStyle.styleBold26(context)),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  Text("Enter New Password",
                      style: AppStyle.styleBold30(context)),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Enter your email and we will send you a link to reset your password.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              AppTextFormField(
                  controller: resetPasswordController.passWord,
                  suffixIcon: const Icon(Icons.lock_outline),
                  hintText: "Password",
                  validator: (value) {}),
              const SizedBox(height: 20),
              AppTextButton(
                  buttonText: "Save",
                  verticalPadding: 10,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  onPressed: () {
                    resetPasswordController.goToSginInScreen();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
