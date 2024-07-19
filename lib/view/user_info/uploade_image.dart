import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skill_swap/controller/profile/profile_info_controller.dart';
import 'package:skill_swap/controller/profile/profile_page_view_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/view/user_info/components/custom_upload_widget.dart';

class UploadeImage extends StatelessWidget {
  const UploadeImage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImpl profileController = Get.find();
    ProfilePageViewControllerImpl profilepageController = Get.find();

    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            const Spacer(),
            AppTextButton(
                buttonText: "Upload",
                textStyle: AppStyle.stylerBold20(context),
                onPressed: () async {
                  await profileController.getImageFromGallery();
                  profilepageController.next();
                }),
          ],
        ),
      ),
    ));
  }
}
