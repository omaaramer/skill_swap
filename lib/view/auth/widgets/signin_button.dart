import 'package:flutter/material.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';

class SiginButton extends StatelessWidget {
  const SiginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonText: "SIGN IN",
      borderRadius: 100,
      verticalPadding: 10,
      textStyle: const TextStyle(color: Colors.white, fontSize: 20),
      onPressed: () {},
    );
  }
}
