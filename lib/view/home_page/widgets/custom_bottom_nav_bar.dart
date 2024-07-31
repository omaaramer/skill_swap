import 'package:flutter/material.dart';
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
        items: const [
          BottomNavigationBarItem(icon: Icon(IconBroken.Home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: "Chat"),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(IconBroken.Edit, color: Colors.white)),
              label: "Add Skill"),
          BottomNavigationBarItem(
              icon: Icon(IconBroken.User1), label: "Community"),
          BottomNavigationBarItem(icon: Icon(IconBroken.Profile), label: "ME"),
        ],
      ),
    );
  }
}
