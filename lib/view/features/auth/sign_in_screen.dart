import 'package:flutter/material.dart';
import 'package:skill_swap/view/features/auth/widgets/divider.dart';
import 'package:skill_swap/view/features/auth/widgets/have_acount_text_widget.dart';
import 'package:skill_swap/view/features/auth/widgets/regester_with_acount.dart';
import 'package:skill_swap/view/features/auth/widgets/screen_header_text.dart';
import 'package:skill_swap/view/features/auth/widgets/sigin_form.dart';
import 'package:skill_swap/view/features/auth/widgets/signin_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: const [
              SizedBox(height: 40),
              AuthScreenTextHeader(
                  title: "Hi ,Welcome Back!",
                  subTitle: "Hello again , You have been missed!"),
              SizedBox(height: 40),
              CustomAuthForm(),
              SizedBox(height: 20),
              SiginButton(),
              SizedBox(height: 20),
              CustomDivider(),
              SizedBox(height: 40),
              RegesterationWithAcounts(),
              SizedBox(height: 40),
              HaveAcountWidget()
            ],
          ),
        ),
      ),
    );
  }
}
