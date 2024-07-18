import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/sign_up_controller.dart';
import 'package:skill_swap/core/helpers/alert_exit_app.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/core/helpers/valid_inpnut.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';
import 'package:skill_swap/view/auth/widgets/have_acount_text_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SignUpControllerImpl>(
          builder: (signUpController) => PopScope(
            canPop: false,
            onPopInvoked: ((didpop) {
              if (didpop) {
                return;
              }
              alertExitApp();
            }),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  SizedBox(
                    height: 170,
                    width: 150,
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.imagesOnboarding3,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text("Create account", style: AppStyle.styleBold30(context)),
                  const Text(
                      "Create an account and enjoy a world of learning and connections."),
                  const SizedBox(height: 40),
                  Form(
                    key: signUpController.formKey,
                    child: Column(
                      children: [
                        AppTextFormField(
                            controller: signUpController.username,
                            suffixIcon: const Icon(
                              Icons.person_outline,
                              color: AppColors.primary,
                            ),
                            hintText: "Enter your Username",
                            validator: (value) {
                              return validInput(value!, 7, 50, "username");
                            }),
                        const SizedBox(height: 10),
                        AppTextFormField(
                            isNumber: true,
                            controller: signUpController.phone,
                            suffixIcon: const Icon(
                              Icons.phone,
                              color: AppColors.primary,
                            ),
                            hintText: "Phone",
                            validator: (value) {
                              return validInput(value!, 7, 50, "phone");
                            }),
                        const SizedBox(height: 10),
                        AppTextFormField(
                            controller: signUpController.email,
                            suffixIcon: const Icon(
                              Icons.email_outlined,
                              color: AppColors.primary,
                            ),
                            hintText: "Email",
                            validator: (value) {
                              return validInput(value!, 7, 50, "email");
                            }),
                        const SizedBox(height: 10),
                        GetBuilder<SignUpControllerImpl>(
                          builder: (signUpController) => AppTextFormField(
                              isObscureText: signUpController.isObscureText,
                              controller: signUpController.password,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  signUpController.showPassword();
                                },
                                icon: Icon(
                                  signUpController.isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.primary,
                                ),
                              ),
                              hintText: "Password",
                              validator: (value) {
                                return validInput(value!, 7, 50, "password");
                              }),
                        ),
                        const SizedBox(height: 10),
                        AppTextButton(
                            buttonText: "Create Account",
                            verticalPadding: 10,
                            textStyle: AppStyle.stylerBold20(context),
                            onPressed: () {
                              signUpController.signUp();
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  HaveAcountWidget(
                    text: "Have an account?",
                    textButton: "Sign In",
                    onPressed: () {
                      signUpController.goToSignInScreen();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
