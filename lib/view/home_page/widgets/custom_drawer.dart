import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skill_swap/core/routing/routes.dart';

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