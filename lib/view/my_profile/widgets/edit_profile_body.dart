import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/controller/profile/edite_profile_controler.dart';
import 'about_me_section.dart';
import 'edite_prfile_info.dart';
import 'edite_profile_header.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({
    super.key,
    required this.userController,
    required this.editProfileControllerImpl,
  });

  final GetUserControllerImpl userController;
  final EditProfileControllerImpl editProfileControllerImpl;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        EditeProfileHeader(userController: userController),
        EditeProfileInfo(
          editProfileControllerImpl: editProfileControllerImpl,
        ),
        SizedBox(height: 20.sp),
        AboutMeSection(
          editProfileControllerImpl: editProfileControllerImpl,
          userController: userController,
        ),
      ],
    );
  }
}
