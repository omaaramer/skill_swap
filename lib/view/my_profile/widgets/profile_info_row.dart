import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class ProfileAchivements extends StatelessWidget {
  const ProfileAchivements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('Skills', style: AppStyle.styleRegular16Grey(context)),
            Text('10', style: AppStyle.blackTitle(context)),
          ],
        ),
        Column(
          children: [
            Text('Experience', style: AppStyle.styleRegular16Grey(context)),
            Text('5', style: AppStyle.blackTitle(context)),
          ],
        ),
        Column(
          children: [
            Text('Rating', style: AppStyle.styleRegular16Grey(context)),
            Text('4.5', style: AppStyle.blackTitle(context)),
          ],
        ),
      ],
    );
  }
}
