import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        Obx(() => GestureDetector(
              onTap: editProfileControllerImpl.toggleEditingName,
              child: editProfileControllerImpl.isEditingName.value
                  ? SizedBox(
                      width: 200,
                      child: TextField(
                        controller: editProfileControllerImpl.nameController,
                        autofocus: true,
                        onSubmitted: editProfileControllerImpl.saveName,
                        style: AppStyle.blackTitle(context),
                      ),
                    )
                  : Text(editProfileControllerImpl.nameController.text,
                      style: AppStyle.blackTitle(context)),
            )),
        SizedBox(height: 10),
        Obx(() => GestureDetector(
              onTap: editProfileControllerImpl.toggleEditingBio,
              child: editProfileControllerImpl.isEditingBio.value
                  ? SizedBox(
                      width: 200,
                      child: TextField(
                        controller: editProfileControllerImpl.bioController,
                        autofocus: true,
                        onSubmitted: editProfileControllerImpl.saveBio,
                        style: AppStyle.styleRegular16Grey(context),
                      ),
                    )
                  : Text(editProfileControllerImpl.bioController.text,
                      style: AppStyle.styleRegular16Grey(context)),
            )),
      ],
    );
  }
}
