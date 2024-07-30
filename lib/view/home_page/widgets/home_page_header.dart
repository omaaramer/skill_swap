import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Swap, learn, grow", style: AppStyle.styleBold18(context)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  // shape: const CircleBorder(),
                  ),
              onPressed: () {
                Get.toNamed(Routes.addSkillScreen);
              },
              child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
