import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
    ComunityScreen(),
    ProfileScreen(),
  ];
  var selectedIndex = 0.obs;

  @override
  void onIconTap(int index) {
    selectedIndex.value = index;
  }
}
