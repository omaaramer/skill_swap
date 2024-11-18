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
import 'package:skill_swap/generated/l10n.dart';
import 'package:skill_swap/view/auth/widgets/have_acount_text_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<SignUpControllerImpl>(
            builder: (signUpController) => PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (didPop) {
                  return;
                }
                alertExitApp();
              },
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
                    Text(S.of(context).signUp,
                        style: AppStyle.styleBold30(context)),
                    Text(S.of(context).welcomeBackMessage1),
                    const SizedBox(height: 40),
                    Form(
                      key: signUpController.formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                              controller: signUpController.email,
                              suffixIcon: const Icon(
                                Icons.email_outlined,
                                color: AppColors.primary,
                              ),
                              hintText: S.of(context).email,
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
                                hintText: S.of(context).password,
                                validator: (value) {
                                  return validInput(value!, 7, 50, "password");
                                }),
                          ),
                          const SizedBox(height: 10),
                          AppTextButton(
                              buttonText: S.of(context).signUp,
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
                      text: S.of(context).haveAccount,
                      textButton: S.of(context).signIn,
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
      ),
    );
  }
}
