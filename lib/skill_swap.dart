import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_swap/core/routing/app_router.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/colores.dart';

class SkillSwap extends StatelessWidget {
  const SkillSwap({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        title: 'SkillSwap',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          // primarySwatch: AppColores.primary as MaterialColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScrreen,
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
