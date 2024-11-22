import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/generated/l10n.dart';

AppBar buildAppBar(
    {required BuildContext context, required void Function()? onPressed}) {
  return AppBar(
    titleSpacing: 0,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back_ios),
    ),
    title: Text(S.of(context).editProfile),
    actions: [
      TextButton(
        onPressed: onPressed,
        child: Text(
          S.of(context).save,
          style: AppStyle.styleBold18(context),
        ),
      )
    ],
  );
}
