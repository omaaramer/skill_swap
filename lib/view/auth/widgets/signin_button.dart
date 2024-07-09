import 'package:flutter/material.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';

class SiginButton extends StatelessWidget {
  const SiginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppTextButton(
        buttonText: "SIGN IN",
        borderRadius: 100,
        verticalPadding: 12,
        textStyle: const TextStyle(color: Colors.white, fontSize: 22),
        onPressed: () {},
      ),
    );
  }
}
