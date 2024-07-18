import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfilePageViewController extends GetxController {
  onchangePage(int index);
  next();
}

class ProfilePageViewControllerImpl extends ProfilePageViewController {
  late PageController pageController;
  int currentIndex = 0;
  @override
  onchangePage(int index) {
    currentIndex = index;

    update();
  }

  @override
  next() {}
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
