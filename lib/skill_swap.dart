import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/helpers/intialbindings.dart';
import 'package:skill_swap/core/routing/get_routes.dart';
import 'package:skill_swap/core/theming/colores.dart';

class SkillSwap extends StatelessWidget {
  const SkillSwap({super.key});

  @override
  Widget build(BuildContext context) {
    // LocalController localController = Get.put(LocalController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        initialBinding: InitialBindings(),
        // locale: localController.language,
        // translations: MyTranslation(),
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        title: 'SkillSwap',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          // primarySwatch: AppColores.primary as MaterialColor,
        ),
        debugShowCheckedModeBanner: false,
        getPages: getPages,

        // initialRoute: Routes.onBoardingScrreen,
        // onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
