import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/services/services.dart';

class LocalController extends GetxController {
  late Locale language;

  MyServices myServices = Get.find();

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
    // update();
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
