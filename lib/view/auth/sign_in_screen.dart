import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/sign_in_controller.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/assets.dart';
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
    SignInControllerImpl signInController = Get.put(SignInControllerImpl());
    return Scaffold(
      body: SafeArea(
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
              CustomAuthForm(
                emailcontroller: signInController.email,
                passwordcontroller: signInController.password,
              ),
              const SizedBox(height: 20),
              const SiginButton(),
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
    );
  }
}
