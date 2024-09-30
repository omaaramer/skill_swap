import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/profile/edite_profile_controler.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/view/my_profile/widgets/profile_info_row.dart';
import '../../controller/Add Skills/get_user_controller.dart';
import 'widgets/edite_prfile_info.dart';
import 'widgets/edite_profile_header.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetUserControllerImpl userController = Get.find();
    EditProfileControllerImpl editProfileControllerImpl =
        Get.put(EditProfileControllerImpl());

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Edit Profile"),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Update",
                style: AppStyle.styleBold18(context),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              EditeProfileHeader(userController: userController),
              EditeProfileInfo(
                  editProfileControllerImpl: editProfileControllerImpl),
              SizedBox(height: 20.sp),
              const ProfileInfo()
            ],
          ),
        ),
      ),
    );
  }
}
