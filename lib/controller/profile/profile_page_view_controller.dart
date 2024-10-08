import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/services/services.dart';
import 'package:skill_swap/view/user_info/components/slider.dart';

abstract class ProfilePageViewController extends GetxController {
  onchangePage(int index);
  next();
}

class ProfilePageViewControllerImpl extends ProfilePageViewController {
  late PageController pageController;
  final formKey = GlobalKey<FormState>();

  int currentIndex = 0;
  @override
  onchangePage(int index) {
    currentIndex = index;

    update();
  }

  MyServices myServices = Get.find();
  @override
  next() {
    if (currentIndex == EditProfilePageview.pages.length - 1) {
      Get.toNamed(Routes.homePage);
      myServices.sharedPreferences.setBool(AppConstant.kUserInfoPref, true);
    } else {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
