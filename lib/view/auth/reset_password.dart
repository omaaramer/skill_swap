import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/reset_password_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';
import 'package:skill_swap/core/helpers/valid_inpnut.dart';

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
                  Text("New Password", style: AppStyle.styleBold30(context)),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Please Enter New Password for your account",
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
                  validator: (value) {
                    return validInput(value!, 7, 30, "password");
                  }),
              const SizedBox(height: 20),
              AppTextFormField(
                  controller: resetPasswordController.confirmPassWord,
                  suffixIcon: const Icon(Icons.lock_outline),
                  hintText: "Confirm Password",
                  validator: (value) {
                    return validInput(value!, 7, 30, "password");
                  }),
              const SizedBox(height: 20),
              AppTextButton(
                  buttonText: "Save",
                  verticalPadding: 10,
                  textStyle:
                      const TextStyle(color: AppColors.white, fontSize: 20),
                  onPressed: () {
                    resetPasswordController.goToScussessResetScreen();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
