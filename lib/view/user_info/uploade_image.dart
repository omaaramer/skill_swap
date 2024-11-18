import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/profile/add_user_info.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/generated/l10n.dart';
import 'package:skill_swap/view/user_info/components/custom_upload_widget.dart';

class UploadeImage extends StatelessWidget {
  const UploadeImage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImpl profileController = Get.find();

    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                Text(
                  S.of(context).uploadPictures,
                  style: AppStyle.styleBold26(context),
                ),
                TextButton(
                  onPressed: () {},
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.homePage);
                    },
                    child: Text(
                      S.of(context).skip,
                      style: AppStyle.styleBold26(context),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).profilePictureMessage,
              textAlign: TextAlign.center,
              style: AppStyle.styleRegular16Grey(context),
            ),
            const Spacer(),
            GetBuilder<ProfileControllerImpl>(
              builder: (_) => CustomUploadWidget(
                url: profileController.url,
                onTap: () {
                  profileController.getImageFromGallery();
                },
                onPressed: () {
                  profileController.getImageFromGallery();
                  // Save Image to some storage
                },
              ),
            ),
            const Spacer(),
            AppTextButton(
                buttonText: S.of(context).next,
                textStyle: AppStyle.stylerBold20(context),
                onPressed: () {
                  profileController.addUserData();
                }),
          ],
        ),
      ),
    ));
  }
}
