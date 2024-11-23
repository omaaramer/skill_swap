import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/helpers/intialbindings.dart';
import 'package:skill_swap/core/routing/get_routes.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/generated/l10n.dart';
import 'core/localization/change_local.dart';
import 'core/localization/is_arabic.dart';

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
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'SkillSwap',
        theme: ThemeData(
          fontFamily: MyFunctions.isArabic() ? 'Cairo' : 'Poppins',
          primaryColor: AppColors.primary,
          brightness: Brightness.light, // This is the light theme
        ),
        debugShowCheckedModeBanner: false,
        getPages: getPages,
      ),
    );
  }
}
