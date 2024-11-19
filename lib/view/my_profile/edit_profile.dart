import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/profile/edite_profile_controler.dart';
import '../../controller/Add Skills/get_user_controller.dart';
import 'widgets/build_app_bar.dart';
import 'widgets/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetUserControllerImpl userController = Get.find();
    EditProfileControllerImpl editProfileControllerImpl =
        Get.put(EditProfileControllerImpl());

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: EditProfileBody(
            userController: userController,
            editProfileControllerImpl: editProfileControllerImpl,
          ),
        ),
      ),
    );
  }
}
