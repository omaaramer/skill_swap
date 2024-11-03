import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/profile/add_user_info.dart';
import 'package:skill_swap/controller/profile/profile_page_view_controller.dart';
import 'package:skill_swap/core/helpers/valid_inpnut.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';
import 'package:skill_swap/view/user_info/components/custom_text_field.dart';

class PersonalDatailsOne extends StatelessWidget {
  static const String id = 'EditeProfileBody';
  const PersonalDatailsOne({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImpl profileController = Get.put(ProfileControllerImpl());
    ProfilePageViewControllerImpl profilepageController = Get.find();
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Text("Personal Details",
                          style: AppStyle.styleBold26(context)),
                      const SizedBox(height: 10),
                      Text(
                        "Provide your personal details to enhance your Skill Swap experience and connect with like-minded individuals.",
                        textAlign: TextAlign.center,
                        style: AppStyle.styleRegular16Grey(context),
                      ),
                      const Expanded(child: SizedBox(height: 20)),
                      Form(
                        key: profilepageController.formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              hint: "Your Username",
                              mycontroller: profileController.name,
                              validator: (value) {
                                return validInput(value!, 3, 20, "text");
                              },
                              icon: Icons.person,
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              hint: "Your Address",
                              mycontroller: profileController.address,
                              icon: Icons.home,
                              validator: (value) {
                                return validInput(value!, 3, 50, "address");
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              hint: "Your Title,eg.developer, designer, etc",
                              mycontroller: profileController.jopTitle,
                              icon: Icons.email,
                              validator: (value) {
                                return validInput(value!, 3, 50, "text");
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              isNumber: true,
                              hint: "Your Phone Number",
                              mycontroller: profileController.phone,
                              icon: Icons.phone,
                              validator: (value) {
                                return validInput(value!, 11, 11, "phone");
                              },
                            ),
                            const SizedBox(height: 40),
                            AppTextButton(
                              buttonText: "Save Changes",
                              textStyle: AppStyle.stylerBold20(context),
                              onPressed: () {
                                if (profilepageController.formKey.currentState!
                                    .validate()) {
                                  profilepageController.next();
                                }
                                // profileController.clearTextInput();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
