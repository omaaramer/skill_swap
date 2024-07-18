import 'package:flutter/material.dart';
import 'package:skill_swap/view/edit_profile/uploade_image.dart';
import 'package:skill_swap/view/edit_profile/user_info_screen.dart';

class EditProfilePageview extends StatelessWidget {
  const EditProfilePageview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: PageView(
        children: const [
          UserInfo(),
          UploadeImage(),
        ],
      ),
    )));
  }
}
