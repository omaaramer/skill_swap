import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/controller/profile/edite_profile_controler.dart';
import 'package:skill_swap/core/helpers/valid_inpnut.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/view/user_info/components/custom_text_field.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    super.key,
    required this.editProfileControllerImpl,
    required this.userController,
  });

  final EditProfileControllerImpl editProfileControllerImpl;
  final GetUserControllerImpl userController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Form(
        key: editProfileControllerImpl.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("حول", style: AppStyle.blackTitle(context)),
            CustomTextFormField(
              initialValue: userController.user.value!.aboutMe,
              onChanged: (value) {
                editProfileControllerImpl.aboutController.text = value;
              },
              maxLines: 5,
              hint: "اكتب نبذة عنك",
              validator: (value) {
                return validInput(value!, 3, 50, "text");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (editProfileControllerImpl.formKey.currentState!
                      .validate()) {
                    editProfileControllerImpl.updateAboutMeInfo();
                    Get.back();
                    userController.getAllUsers();
                  }
                },
                child: const Text("ok"))
          ],
        ),
      ),
    );
  }
}
