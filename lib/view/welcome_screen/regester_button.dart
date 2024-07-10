import 'package:flutter/material.dart';
import 'package:skill_swap/core/helpers/extentions.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
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
            text: "LOG IN",
            bottomRightradius: 8,
            topLeftRadius: 8,
            bottomLeftRadius: 8,
            topRightRadius: 32,
            onPressed: () {
              context.pushNamed(Routes.signInScreen);
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
              context.pushNamed(Routes.signUpScreen);
            },
          ),
        ),
      ],
    );
  }
}
