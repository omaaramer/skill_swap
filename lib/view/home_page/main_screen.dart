import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/home/home_page_controller.dart';
import 'package:skill_swap/view/home_page/widgets/custom_bottom_nav_bar.dart';
import 'package:skill_swap/view/home_page/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(HomePageControllerImpl()); // Initialize controller

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey,
        key: scaffoldKey,
        drawer: const CustomDrawer(),

        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
        bottomNavigationBar: CustomBottomNavBar(controller: controller),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}
