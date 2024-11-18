import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/sign_in_controller.dart';
import 'package:skill_swap/core/helpers/alert_exit_app.dart';
import 'package:skill_swap/core/helpers/valid_inpnut.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';
import 'package:skill_swap/generated/l10n.dart';
import 'package:skill_swap/view/auth/widgets/divider.dart';
import 'package:skill_swap/view/auth/widgets/have_acount_text_widget.dart';
import 'package:skill_swap/view/auth/widgets/regester_with_acount.dart';
import 'package:skill_swap/view/auth/widgets/screen_header_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignInControllerImpl signInController = Get.put(SignInControllerImpl());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                return;
              }
              alertExitApp();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  SizedBox(
                    height: 170,
                    width: 150,
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.imagesOnboarding1,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  AuthScreenTextHeader(
                    title: S.of(context).signIn,
                    subTitle: S.of(context).welcomeBackMessage2,
                  ),
                  const SizedBox(height: 40),
                  Form(
                      key: signInController.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const Text("Email",
                          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          AppTextFormField(
                              controller: signInController.email,
                              suffixIcon: const Icon(
                                Icons.email_outlined,
                                color: AppColors.primary,
                              ),
                              hintText: "name@gmail.com ",
                              labelText: S.of(context).email,
                              validator: (val) {
                                return validInput(val!, 7, 50, "email");
                              }),
                          const SizedBox(height: 16),
                          // const Text("Password",
                          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          GetBuilder<SignInControllerImpl>(
                            builder: (controller) => AppTextFormField(
                              isObscureText: signInController.isObscureText,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  signInController.showPassword();
                                },
                                icon: Icon(
                                    signInController.isObscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors.primary),
                              ),
                              hintText: "*********",
                              labelText: S.of(context).password,
                              validator: (val) {
                                return validInput(val!, 7, 30, "password");
                              },
                              controller: signInController.password,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.forgetPasswordScreen);
                                },
                                child: Text(
                                  S.of(context).forgotPassword,
                                )),
                          ),
                        ],
                      )),
                  const SizedBox(height: 20),
                  AppTextButton(
                    buttonText: S.of(context).signIn,
                    borderRadius: 100,
                    verticalPadding: 10,
                    textStyle: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                    onPressed: () {
                      signInController.signIn();
                    },
                  ),
                  const SizedBox(height: 20),
                  const CustomDivider(),
                  const SizedBox(height: 40),
                  const RegesterationWithAcounts(),
                  // const SizedBox(height: 40),
                  HaveAcountWidget(
                    text: S.of(context).noAccount,
                    textButton: S.of(context).signUp,
                    onPressed: () {
                      signInController.goToSignUpScreen();
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
