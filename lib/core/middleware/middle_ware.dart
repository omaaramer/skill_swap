import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool(AppConstant.kOnBoardingPref) ==
        true) {
      return const RouteSettings(name: Routes.welcomeScreen);
    }
    return null;
  }
}
