import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skill_swap/view/home_page/add_skill_screen.dart';
import 'package:skill_swap/view/home_page/chat_screen.dart';
import 'package:skill_swap/view/home_page/comunity_screen.dart';
import 'package:skill_swap/view/home_page/posts_screen.dart';
import 'package:skill_swap/view/home_page/profile_screen.dart';

abstract class HomePageController extends GetxController {
  void onIconTap(int index);
}

class HomePageControllerImpl extends HomePageController {
  List<Widget> screens = const [
    PostsPage(),
    ChatScreen(),
    AddSkillScreen(),
    CommunityScreen(),
    ProfileScreen(),
  ];
  List<String> titles = ['Posts', 'Chat', 'Add Skill', 'Community', 'Profile'];
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
