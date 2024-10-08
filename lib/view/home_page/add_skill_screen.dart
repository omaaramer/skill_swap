import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/add_skill_controller.dart';
import 'package:skill_swap/core/helpers/valid_inpnut.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';
import 'package:skill_swap/view/home_page/widgets/cutoem_toggle_button.dart';
import 'package:skill_swap/view/user_info/components/custom_upload_widget.dart';

class AddSkillScreen extends StatelessWidget {
  const AddSkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddSkillControllerImpl addSkillControllerImpl =
        Get.put(AddSkillControllerImpl());
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            title: const Text("Add Skill"),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.offNamed(Routes.homePage);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Form(
                    key: addSkillControllerImpl.formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        AppTextFormField(
                          hintText: "My Skill/ My Service (eg. piano) ",
                          controller: addSkillControllerImpl.mySkill,
                          validator: (value) {
                            return validInput(value!, 3, 50, "username");
                          },
                        ),
                        const SizedBox(height: 20),
                        AppTextFormField(
                          hintText: "Skill you want to get (eg. programming) ",
                          controller: addSkillControllerImpl.skillNeeded,
                          validator: (value) {
                            return validInput(value!, 3, 50, "username");
                          },
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<AddSkillControllerImpl>(
                          builder: (_) => CustomUploadWidget(
                            url: addSkillControllerImpl.url,
                            onPressed: () {
                              addSkillControllerImpl.getImageFromGallery();
                            },
                            onTap: () {
                              addSkillControllerImpl.getImageFromGallery();
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: AnimatedToggle(
                              values: const ["ONLINE", "IN PERSON"],
                              onToggleCallback: (index) {
                                index == 0
                                    ? addSkillControllerImpl.isOnline = true
                                    : addSkillControllerImpl.isOnline = false;
                              }),
                        ),
                        const Expanded(
                            child: SizedBox(
                          height: 10,
                        )),
                        AppTextButton(
                            buttonText: "POST",
                            textStyle: AppStyle.stylerBold20(context),
                            onPressed: () {
                              addSkillControllerImpl.checkIfUserInfoExist();
                              // addSkillControllerImpl.clearTextInput();
                              // getSkillPostDataControllerImpl.getSkillPostData();
                            }),
                        const SizedBox(height: 20),
                      ],
                    ),
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
