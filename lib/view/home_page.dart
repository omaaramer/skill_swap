import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skill_swap/controller/profile/pick_date_controller.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.disconnect();
            Get.offAllNamed(Routes.signInScreen);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text("Home Page", style: AppStyle.styleBold26(context)),
      ),
      body: Container(
        child: Center(),
      ),
    );
  }
}
