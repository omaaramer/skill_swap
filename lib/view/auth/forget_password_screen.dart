import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/forget_password_controlller.dart';
import 'package:skill_swap/controller/Auth/sign_up_controller.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';
import 'package:skill_swap/view/auth/widgets/have_acount_text_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImpl forgetPasswordController =
        Get.put(ForgetPasswordControllerImpl());
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
          title: Text("Forget Password", style: AppStyle.styleBold26(context)),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  Text("Check Your Email",
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
                  controller: forgetPasswordController.email,
                  suffixIcon: const Icon(Icons.email_outlined),
                  hintText: "Email",
                  validator: (value) {}),
              const SizedBox(height: 20),
              AppTextButton(
                  buttonText: "Check",
                  verticalPadding: 10,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  onPressed: () {
                    forgetPasswordController.goToVerifyScreen();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
