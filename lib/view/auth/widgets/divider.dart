import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/generated/l10n.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            height: 20,
            thickness: 1,
            color: AppColors.grey,
          ),
        ),
        const SizedBox(width: 10),
        Text(S.of(context).orContinueWith),
        const SizedBox(width: 10),
        const Expanded(
          child: Divider(
            height: 20, // Adjusted height to match the first Divider
            thickness: 1,
            color: AppColors.grey, // Changed color for visibility
          ),
        ),
      ],
    );
  }
}
