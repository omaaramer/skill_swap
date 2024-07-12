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
import 'package:skill_swap/view/auth/widgets/divider.dart';
import 'package:skill_swap/view/auth/widgets/have_acount_text_widget.dart';
import 'package:skill_swap/view/auth/widgets/regester_with_acount.dart';
import 'package:skill_swap/view/auth/widgets/screen_header_text.dart';
import 'package:skill_swap/view/auth/widgets/sigin_form.dart';
import 'package:skill_swap/view/auth/widgets/signin_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MySignInControllerImpl signInController = Get.put(MySignInControllerImpl());
    return Scaffold(
      body: SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvoked: ((didpop) {
            if (didpop) {
              return;
            }
            alertExitApp();
          }),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                // const SizedBox(height: 40),
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
                const AuthScreenTextHeader(
                    title: "Hi ,Welcome Back!",
                    subTitle: "Hello again , You have been missed!"),
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
                            labelText: "Email",
                            validator: (val) {
                              return validInput(val!, 7, 50, "email");
                            }),
                        const SizedBox(height: 16),
                        // const Text("Password",
                        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        GetBuilder<MySignInControllerImpl>(
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
                            labelText: "Password",
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
                              child: const Text("Forgot Password?")),
                        ),
                      ],
                    )),
                const SizedBox(height: 20),
                AppTextButton(
                  buttonText: "SIGN IN",
                  borderRadius: 100,
                  verticalPadding: 10,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 20),
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
                  text: "Don't have an account?",
                  textButton: "Sign Up",
                  onPressed: () {
                    signInController.goToSignUpScreen();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
