import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/view/home_page/add_skill_screen.dart';
import '../../controller/Add Skills/get_user_controller.dart';
import 'edit_profile.dart';
import 'widgets/custom_outline_button.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_info_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetUserControllerImpl userController = Get.find();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ProfileHeader(userController: userController),
            Text(userController.user!.fullname,
                style: AppStyle.blackTitle(context)),
            Text(userController.user!.jopTitle,
                style: AppStyle.styleRegular16Grey(context)),
            SizedBox(height: 20.sp),
            const ProfileInfo(),
            SizedBox(height: 20.sp),
            Row(
              children: [
                Expanded(
                  child: CustomOutlineButton(
                    onPressed: () {
                      Get.to(() => const AddSkillScreen());
                    },
                    child: Text('Add Skills',
                        style: AppStyle.styleBold18(context)),
                  ),
                ),
                SizedBox(width: 5.sp),
                Expanded(
                  child: CustomOutlineButton(
                    onPressed: () {
                      Get.to(() => const EditProfileScreen());
                    },
                    child: Icon(IconBroken.Edit,
                        color: AppColors.primary, size: 20.sp),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
