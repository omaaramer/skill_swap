import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/verify_code_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImpl verifyCodeController =
        Get.put(VerifyCodeControllerImpl());
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
          title:
              Text("Verification Code", style: AppStyle.styleBold26(context)),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  Text("Check Code", style: AppStyle.styleBold30(context)),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Please enter the verification code sent to your email",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              OtpTextField(
                fieldWidth: 50,
                // fieldHeight: 150,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                numberOfFields: 5,
                borderColor: AppColors.primary,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  verifyCodeController.goToResetPassword();
                }, // end onSubmit
              ),
            ],
          ),
        ),
      ),
    );
  }
}
