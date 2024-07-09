import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/onboarding_controller.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';

class OnBoardingButton extends GetView<OnBoardingControllerImpl> {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: AppTextButton(
        backgroundColor: AppColors.primary,
        buttonText: controller.changeButtonText(),
        textStyle: const TextStyle(color: Colors.white),
        onPressed: () {
          controller.next();
        },
      ),
    );
  }
}
