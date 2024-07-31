import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/services/services.dart';
import 'package:skill_swap/data/static/onboarding_static_data.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImpl extends OnBoardingController {
  int currentPageIndex = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  @override
  next() {
    if (currentPageIndex == onBoardingList.length - 1) {
      if (FirebaseAuth.instance.currentUser != null &&
          FirebaseAuth.instance.currentUser!.emailVerified) {
        myServices.sharedPreferences.setBool(AppConstant.kOnBoardingPref, true);
        Get.toNamed(Routes.editProfile);
      } else {
        Get.toNamed(Routes.welcomeScreen);
      }
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
}
