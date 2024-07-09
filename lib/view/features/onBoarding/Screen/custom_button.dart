import 'package:flutter/material.dart';
import 'package:skill_swap/core/helpers/extentions.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/data/static/onboarding_static_data.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
    required this.currentIndex,
    required this.pageController,
  });

  final int currentIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: AppTextButton(
        backgroundColor: AppColors.primary,
        buttonText: currentIndex == onBoardingList.length - 1
            ? "Get Started"
            : "Continue",
        textStyle: const TextStyle(color: Colors.white),
        onPressed: () {
          if (currentIndex == onBoardingList.length - 1) {
            context.pushNamed(Routes.welcomeScreen);
          } else {
            pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          }
        },
      ),
    );
  }
}
