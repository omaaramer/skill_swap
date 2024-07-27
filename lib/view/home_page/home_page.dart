import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/view/home_page/home_list_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
        body: const Column(
          children: [
            HomePageHeader(),
            Expanded(child: HomePageListView()),
          ],
        ),
      ),
    );
  }
}

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Swap, learn, grow", style: AppStyle.styleBold18(context)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  // shape: const CircleBorder(),
                  ),
              onPressed: () {
                Get.toNamed(Routes.addSkillScreen);
              },
              child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Sign Out"),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              Get.offAllNamed(Routes.signInScreen);
            },
          ),
        ],
      ),
    );
  }
}
