import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/theming/app_style.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    titleSpacing: 0,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.arrow_back_ios),
    ),
    title: const Text("Edit Profile"),
    actions: [
      TextButton(
        onPressed: () {},
        child: Text(
          "Update",
          style: AppStyle.styleBold18(context),
        ),
      )
    ],
  );
}
