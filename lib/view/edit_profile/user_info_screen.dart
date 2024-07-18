import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/profile/profile_info_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';

class UserInfo extends StatelessWidget {
  static const String id = 'EditeProfileBody';
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImpl profileController = Get.put(ProfileControllerImpl());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.7,
            child: Column(
              children: [
                const SizedBox(height: (40)),
                Text("Personal Details ", style: AppStyle.styleBold26(context)),
                const SizedBox(height: (10)),
                Text(
                  "Provide your personal details to enhance your Skill Swap experience and connect with like-minded individuals.",
                  textAlign: TextAlign.center,
                  style: AppStyle.styleRegular16Grey(context),
                ),
                const Spacer(),
                Form(
                  key: profileController.formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: "Your full name",
                        controller: profileController.name,
                        validator: (value) {},
                      ),
                      const SizedBox(height: (10)),
                      AppTextFormField(
                        hintText: "Your Location",
                        controller: profileController.address,
                        validator: (value) {},
                      ),
                      const SizedBox(height: (10)),
                      AppTextFormField(
                        hintText: "Your Email",
                        controller: profileController.email,
                        validator: (value) {},
                      ),
                      const SizedBox(height: (20)),
                      AppTextFormField(
                        hintText: "Your Phone",
                        controller: profileController.phone,
                        validator: (value) {},
                      ),
                      const SizedBox(height: (10)),
                    ],
                  ),
                ),
                const SizedBox(height: (10)),
                AppTextButton(
                  buttonText: "Save Changes",
                  textStyle: AppStyle.stylerBold20(context),
                  onPressed: () {
                    profileController.addUserData();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
