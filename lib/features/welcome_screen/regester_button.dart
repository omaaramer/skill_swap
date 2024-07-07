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
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "LOG IN",
            bottomRightradius: 8,
            topLeftRadius: 8,
            bottomLeftRadius: 8,
            topRightRadius: 32,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            text: "SIGN UP",
            bottomRightradius: 8,
            topLeftRadius: 32,
            bottomLeftRadius: 8,
            topRightRadius: 8,
          ),
        ),
      ],
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .25,
        child: AppTextButton(
            borderRadius: 50,
            backgroundColor: Colors.white.withOpacity(.1),
            buttonText: text,
            textStyle: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
            onPressed: onPressed),
      ),
    );
  }
}
