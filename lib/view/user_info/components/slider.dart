import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/profile/profile_page_view_controller.dart';
import 'package:skill_swap/view/user_info/pick_date.dart';
import 'package:skill_swap/view/user_info/uploade_image.dart';
import 'package:skill_swap/view/user_info/personal_datails_1.dart';

class EditProfilePageview extends StatelessWidget {
  const EditProfilePageview({super.key});
  static List<Widget> pages = const [
    PickDate(),
    PersonalDatailsOne(),
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
