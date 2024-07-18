import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skill_swap/controller/profile_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/view/edit_profile/components/custom_upload_widget.dart';

class UploadeImage extends StatelessWidget {
  const UploadeImage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImpl profileController = Get.find();
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              "Upload your Pictures",
              style: AppStyle.styleBold26(context),
            ),
            const SizedBox(height: 20),
            Text(
              "Personalize your account with a profile picture upload",
              textAlign: TextAlign.center,
              style: AppStyle.styleRegular16Grey(context),
            ),
            const Spacer(),
            CustomUploadWidget(
              url: profileController.url,
              onTap: () async {
                await profileController.getImageFromGallery();
              },
              onPressed: () async {
                await profileController.getImageFromGallery();
                // Save Image to some storage
              },
            ),
          ],
        ),
      ),
    ));
  }
}
