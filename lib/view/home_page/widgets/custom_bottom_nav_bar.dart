import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/home/home_page_controller.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/theming/colores.dart';

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
          const BottomNavigationBarItem(
              icon: Icon(IconBroken.Home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(IconBroken.Chat), label: "Chat"),
          const BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(IconBroken.Edit, color: Colors.white, size: 30)),
              label: "Add Skill"),
          BottomNavigationBarItem(
              icon: Transform.rotate(
                angle: 90 * (3.14159 / 180), // Convert degrees to radians
                child: Icon(IconBroken.Swap, size: 20.sp // Color of the icon
                    ),
              ),
              label: "Requests"),
          const BottomNavigationBarItem(
              icon: Icon(IconBroken.Profile), label: "ME"),
        ],
      ),
    );
  }
}
