import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:skill_swap/controller/profile/add_user_info.dart';
import 'package:skill_swap/controller/profile/profile_page_view_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/generated/l10n.dart';

class PickDate extends StatelessWidget {
  const PickDate({super.key});

  @override
  Widget build(BuildContext context) {
    ProfilePageViewControllerImpl profilePageViewController = Get.find();
    ProfileControllerImpl profileController = Get.put(ProfileControllerImpl());

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(S.of(context).dateOfBirth,
                  style: AppStyle.styleBold26(context)),
              const SizedBox(height: 10),
              Text(
                S.of(context).dobMessage,
                textAlign: TextAlign.center,
                style: AppStyle.styleRegular16Grey(context),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(2000, 1, 1),
                  onDateTimeChanged: profileController.updateBirthDate,
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<ProfileControllerImpl>(
                  builder: (_) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: AppColors.secondary),
                        child: Text(
                            "${profileController.birthDate.toLocal()}"
                                .split(' ')[0],
                            style: AppStyle.styleBold26(context)),
                      )),
              const SizedBox(height: 10),
              AppTextButton(
                  buttonText: S.of(context).selectDate,
                  textStyle: AppStyle.stylerBold20(context),
                  onPressed: () {
                    // Get.toNamed(Routes.editProfile);

                    profilePageViewController.next();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
