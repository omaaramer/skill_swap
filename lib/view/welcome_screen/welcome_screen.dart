import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/view/onBoarding/widget/custom_button.dart';
import 'package:skill_swap/view/welcome_screen/regester_button.dart';
import 'package:skill_swap/view/welcome_screen/welcome_screen_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: AppColors.primary,
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomSmallButton(
                  text: "Back",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Center(
                  child: SvgPicture.asset(
                    Assets.imagesOnboarding3,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Spacer(),
              const WelcomeScreenBody(),
            ],
          ),
        ),
      ),
    );
  }
}
