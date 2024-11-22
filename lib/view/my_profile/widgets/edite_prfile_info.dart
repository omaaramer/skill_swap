import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/controller/profile/edite_profile_controler.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class EditeProfileInfo extends StatelessWidget {
  const EditeProfileInfo({
    super.key,
    required this.editProfileControllerImpl,
  });

  final EditProfileControllerImpl editProfileControllerImpl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GetX<GetUserControllerImpl>(
            init: GetUserControllerImpl(),
            builder: (controller) {
              return GestureDetector(
                onTap: editProfileControllerImpl.toggleEditingName,
                child: editProfileControllerImpl.isEditingName.value
                    ? SizedBox(
                        width: 200,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: editProfileControllerImpl.nameController,
                          autofocus: true,
                          onSubmitted: editProfileControllerImpl.saveName,
                          style: AppStyle.blackTitle(context),
                        ),
                      )
                    : Text(controller.user.value!.fullname,
                        style: AppStyle.blackTitle(context)),
              );
            }),
        const SizedBox(height: 10),
        GetX<GetUserControllerImpl>(builder: (controller) {
          return GestureDetector(
            onTap: editProfileControllerImpl.toggleEditingBio,
            child: editProfileControllerImpl.isEditingBio.value
                ? SizedBox(
                    width: 200,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: editProfileControllerImpl.bioController,
                      autofocus: true,
                      onSubmitted: editProfileControllerImpl.saveBio,
                      style: AppStyle.styleRegular16Grey(context),
                    ),
                  )
                : Text(
                    (controller.user.value?.bio?.isEmpty ?? true)
                        ? "write your bio"
                        : controller.user.value!.bio!,
                    style: AppStyle.styleRegular16Grey(context),
                  ),
          );
        }),
      ],
    );
  }
}
