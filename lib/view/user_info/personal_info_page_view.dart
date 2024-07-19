import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/profile/profile_page_view_controller.dart';
import 'package:skill_swap/view/user_info/components/indicator.dart';
import 'package:skill_swap/view/user_info/components/slider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfilePageViewControllerImpl());

    return const SafeArea(
      child: Scaffold(
        body: Column(children: [
          Expanded(flex: 9, child: EditProfilePageview()),
          // SizedBox(height: 10),
          Expanded(flex: 1, child: SmothIndicator()),
        ]),
      ),
    );
  }
}
