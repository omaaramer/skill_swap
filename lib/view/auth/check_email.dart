import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/check_email_controller.dart';
import 'package:skill_swap/controller/Auth/forget_password_controlller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImpl checkEmailController =
        Get.put(CheckEmailControllerImpl());
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
          title: Text("Check Email", style: AppStyle.styleBold26(context)),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  Text("Success Sign Up", style: AppStyle.styleBold30(context)),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Please enter your email and we will send you a link to reset your password.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              AppTextFormField(
                  controller: checkEmailController.email,
                  suffixIcon: const Icon(Icons.email_outlined),
                  hintText: "Email",
                  validator: (value) {}),
              const SizedBox(height: 20),
              AppTextButton(
                  buttonText: "Check",
                  verticalPadding: 10,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  onPressed: () {
                    checkEmailController.goToVerifyCodeSignUpScreen();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
