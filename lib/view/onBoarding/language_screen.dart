import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/localization/change_local.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/generated/l10n.dart';

class LanguageSelectionScreen extends GetView<LocalController> {
  const LanguageSelectionScreen({super.key});

  // final Function(Locale) onLanguageSelected;

  // LanguageSelectionScreen({required this.onLanguageSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text( '')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).lang,
              style: AppStyle.styleBold26(context),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: AppTextButton(
                  verticalPadding: 0,
                  buttonText: S.of(context).en,
                  textStyle: TextStyle(color: AppColors.white, fontSize: 16.sp),
                  onPressed: () {
                    controller.changeLanguage('en');
                    Get.toNamed(Routes.onBoardingScrreen);
                  }),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: AppTextButton(
                  verticalPadding: 0,
                  buttonText: S.of(context).ar,
                  textStyle: TextStyle(color: AppColors.white, fontSize: 16.sp),
                  onPressed: () {
                    controller.changeLanguage('ar');
                    Get.toNamed(Routes.onBoardingScrreen);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
