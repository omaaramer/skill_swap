import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/widgets/custom_redues_button.dart';

class RegesterationButtons extends StatelessWidget {
  const RegesterationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "SIGN IN",
            bottomRightradius: 8,
            topLeftRadius: 8,
            bottomLeftRadius: 8,
            topRightRadius: 32,
            onPressed: () {
              Get.offAllNamed(Routes.signInScreen);
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            text: "SIGN UP",
            bottomRightradius: 8,
            topLeftRadius: 32,
            bottomLeftRadius: 8,
            topRightRadius: 8,
            onPressed: () {
              Get.offAllNamed(Routes.signUpScreen);
            },
          ),
        ),
      ],
    );
  }
}
