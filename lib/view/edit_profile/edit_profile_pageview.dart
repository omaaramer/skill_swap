import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/profile/profile_page_view_controller.dart';
import 'package:skill_swap/view/edit_profile/pick_date.dart';
import 'package:skill_swap/view/edit_profile/uploade_image.dart';
import 'package:skill_swap/view/edit_profile/user_info_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EditProfilePageview extends StatelessWidget {
  const EditProfilePageview({super.key});
  static List<Widget> pages = const [
    PickDate(),
    UserInfo(),
    UploadeImage(),
  ];
  @override
  Widget build(BuildContext context) {
    ProfilePageViewControllerImpl controller =
        Get.put(ProfilePageViewControllerImpl());
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: controller.pageController,
          children: pages,
          onPageChanged: (value) {
            controller.onchangePage(value);
          },
        ),
      ),
    );
  }
}
