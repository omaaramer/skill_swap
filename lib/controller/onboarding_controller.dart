import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/data/static/onboarding_static_data.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
  changeButtonText();
}

class OnBoardingControllerImpl extends OnBoardingController {
  int currentPageIndex = 0;
  late PageController pageController;
  @override
  next() {
    if (currentPageIndex == onBoardingList.length - 1) {
      Get.toNamed(Routes.welcomeScreen);
    } else {
      currentPageIndex++;
      pageController.animateToPage(
        currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPageIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  changeButtonText() {
    if (currentPageIndex == onBoardingList.length - 1) {
      return "Get Started";
    } else {
      return "Continue";
    }
  }
}