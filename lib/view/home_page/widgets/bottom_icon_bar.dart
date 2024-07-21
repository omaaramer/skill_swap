import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/core/theming/colores.dart';

class CardBottomIconBar extends StatelessWidget {
  const CardBottomIconBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: Colors.grey.shade300,
              ),
              onPressed: () {},
              child:
                  Image.asset(color: AppColors.primary, Assets.imagesSaveIcon)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.grey.shade300,
            ),
            onPressed: () {},
            child: Image.asset(
              Assets.imagesSwapIcon,
              color: AppColors.primary,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.grey.shade300,
            ),
            onPressed: () {},
            child: Image.asset(
              Assets.imagesMessageIcon,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
