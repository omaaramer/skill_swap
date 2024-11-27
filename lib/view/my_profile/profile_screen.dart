import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/generated/l10n.dart';
import 'package:skill_swap/view/auth/widgets/divider.dart';
import 'package:skill_swap/view/home_page/add_skill_screen.dart';
import '../../controller/Add Skills/get_user_controller.dart';
import 'edit_profile.dart';
import 'widgets/custom_outline_button.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_info_row.dart';
import 'widgets/profile_skills_listview.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              GetX<GetUserControllerImpl>(builder: (controller) {
                return Column(
                  children: [
                    Text(controller.user.value!.fullname,
                        style: AppStyle.blackTitle(context)),
                    Text(
                      (controller.user.value?.bio?.isEmpty ?? true)
                          ? "click edit to add bio"
                          : controller.user.value!.bio!,
                      style: AppStyle.styleRegular16Grey(context),
                    ),
                  ],
                );
              }),
              SizedBox(height: 10.sp),
              const ProfileButtons(),
              SizedBox(height: 10.sp),
              // const ProfileAchivements(),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      height: 20,
                      thickness: 1.5,
                      color: AppColors.secondary,
                    ),
                    Text(S.of(context).skills,
                        style: AppStyle.blackTitle(context),
                        textAlign: TextAlign.start),
                    SizedBox(
                      height: 100,
                      child: ProfileSkillsListView(),
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("حول", style: AppStyle.blackTitle(context)),
                      GetX<GetUserControllerImpl>(builder: (controller) {
                        return Text(
                          controller.user.value!.aboutMe ??
                              "click edit to add about me",
                          style: AppStyle.styleRegular16Grey(context),
                        );
                      })
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomOutlineButton(
            onPressed: () {
              Get.off(() => const AddSkillScreen());
            },
            child: Text(S.of(context).addSkill,
                style: AppStyle.regular18Primary(context)),
          ),
        ),
        SizedBox(width: 5.sp),
        Expanded(
          child: CustomOutlineButton(
            onPressed: () {
              Get.to(() => const EditProfileScreen());
            },
            child: Text(S.of(context).editProfile,
                style: AppStyle.regular18Primary(context)),
          ),
        ),
      ],
    );
  }
}
