import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/assets.dart';

class AuthScreenTextHeader extends StatelessWidget {
  const AuthScreenTextHeader(
      {super.key, required this.title, required this.subTitle});
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppStyle.styleBold30(context),
            ),
            Image.asset(Assets.imagesNotoWavingHand)
          ],
        ),
        Text(subTitle)
      ],
    );
  }
}
