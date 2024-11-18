import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/home/home_page_controller.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/generated/l10n.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.controller,
  });

  final HomePageControllerImpl controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: controller.onIconTap,
        currentIndex: controller.selectedIndex.value,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(IconBroken.Home), label: S.of(context).home),
          BottomNavigationBarItem(
              icon: const Icon(IconBroken.Chat), label: S.of(context).chat),
          BottomNavigationBarItem(
              icon: const CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child:
                      Icon(IconBroken.Edit, color: AppColors.white, size: 30)),
              label: S.of(context).addSkill),
          BottomNavigationBarItem(
              icon: Transform.rotate(
                angle: 90 * (3.14159 / 180), // Convert degrees to radians
                child: Icon(IconBroken.Swap, size: 20.sp // Color of the icon
                    ),
              ),
              label: S.of(context).requests),
          BottomNavigationBarItem(
              icon: const Icon(IconBroken.Profile),
              label: S.of(context).profile),
        ],
      ),
    );
  }
}
