import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/helpers/intialbindings.dart';
import 'package:skill_swap/core/routing/get_routes.dart';
import 'package:skill_swap/core/theming/colores.dart';

import 'core/localization/changeLocal.dart';
import 'core/localization/translation.dart';

class SkillSwap extends StatelessWidget {
  const SkillSwap({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController localController = Get.put(LocalController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        initialBinding: InitialBindings(),
        locale: localController.language,
        translations: MyTranslation(),
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        title: 'SkillSwap',
        // darkTheme: ThemeData(
        //   primaryColor: AppColors.primary,
        //   brightness: Brightness.dark, // This is the dark theme
        // ),
        theme: ThemeData(
          primaryColor: AppColors.primary,
          brightness: Brightness.light, // This is the light theme
        ),
        debugShowCheckedModeBanner: false,
        getPages: getPages,
      ),
    );
  }
}
