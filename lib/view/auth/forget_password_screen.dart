import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/forget_password_controlller.dart';
import 'package:skill_swap/core/helpers/valid_inpnut.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';
import 'package:skill_swap/generated/l10n.dart';

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
          title: Text(S.of(context).forgetPassword,
              style: AppStyle.styleBold26(context)),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  Text(S.of(context).checkYourEmail,
                      style: AppStyle.styleBold30(context)),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      S.of(context).resetPasswordMessage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              AppTextFormField(
                  controller: forgetPasswordController.email,
                  suffixIcon: const Icon(Icons.email_outlined),
                  hintText: S.of(context).email,
                  validator: (value) {
                    return validInput(value!, 7, 50, "email");
                  }),
              const SizedBox(height: 20),
              AppTextButton(
                  buttonText: S.of(context).check,
                  verticalPadding: 10,
                  textStyle:
                      const TextStyle(color: AppColors.white, fontSize: 20),
                  onPressed: () {
                    forgetPasswordController.checkEmail();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
