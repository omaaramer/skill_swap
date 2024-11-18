import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';

class SiginButton extends StatelessWidget {
  const SiginButton({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonText: "SIGN IN",
      borderRadius: 100,
      verticalPadding: 10,
      textStyle: const TextStyle(color: AppColors.white, fontSize: 20),
      onPressed: () {},
    );
  }
}
