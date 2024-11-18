import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_material_pickers/main.dart';
import 'package:get/get.dart';
import 'package:skill_swap/generated/l10n.dart';
import 'package:skill_swap/view/chat/chat_page.dart';
import 'package:skill_swap/view/home_page/add_skill_screen.dart';
import 'package:skill_swap/view/home_page/posts_screen.dart';
import 'package:skill_swap/view/my_profile/profile_screen.dart';
import 'package:skill_swap/view/swap_requests/requests_page.dart';

abstract class HomePageController extends GetxController {
  void onIconTap(int index);
}

class HomePageControllerImpl extends HomePageController {
  List<Widget> screens = [
    const PostsPage(),
    ChatHomePage(),
    const AddSkillScreen(),
    const RequestsPage(),
    const ProfileScreen(),
  ];
  List<String> titles = [
    S.of(Get.context!).home,
    S.of(Get.context!).chat,
    S.of(Get.context!).addSkill,
    S.of(Get.context!).requests,
    S.of(Get.context!).profile
  ];
  var selectedIndex = 0.obs;

  @override
  void onIconTap(int index) {
    if (index == 2) {
      Get.to(() => const AddSkillScreen());
    } else {
      selectedIndex.value = index;
    }
  }
}
