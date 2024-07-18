import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/profile/profile_page_view_controller.dart';
import 'package:skill_swap/view/edit_profile/components/indicator.dart';
import 'package:skill_swap/view/edit_profile/edit_profile_pageview.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfilePageViewControllerImpl());

    return const SafeArea(
      child: Scaffold(
        body: Column(children: [
          Expanded(flex: 4, child: EditProfilePageview()),
          SizedBox(height: 20),
          Expanded(flex: 1, child: SmothIndicator()),
        ]),
      ),
    );
  }
}
