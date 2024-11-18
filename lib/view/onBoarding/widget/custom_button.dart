import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/onboarding_controller.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/generated/l10n.dart';

class OnBoardingButton extends GetView<OnBoardingControllerImpl> {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: AppTextButton(
        backgroundColor: AppColors.primary,
        buttonText: S.of(context).next,
        textStyle: const TextStyle(color: AppColors.white),
        onPressed: () {
          controller.next();
        },
      ),
    );
  }
}

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color,
      this.backgroundColor});
  final String text;
  final void Function() onPressed;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .25,
        child: AppTextButton(
            buttonHeight: 40,
            verticalPadding: 0,
            borderRadius: 50,
            backgroundColor: backgroundColor ?? AppColors.white.withOpacity(.1),
            buttonText: text,
            textStyle: TextStyle(
              fontSize: 16,
              color: color ?? AppColors.white,
              fontWeight: FontWeight.w500,
            ),
            onPressed: onPressed),
      ),
    );
  }
}
