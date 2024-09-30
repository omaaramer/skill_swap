
import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/colores.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({super.key, this.onPressed, required this.child});
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
