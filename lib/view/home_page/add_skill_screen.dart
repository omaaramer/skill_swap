import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/add_skill_controller.dart';
import 'package:skill_swap/core/helpers/valid_inpnut.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';
import 'package:skill_swap/generated/l10n.dart';
import 'package:skill_swap/view/home_page/widgets/custom_toggle_button.dart';
import 'package:skill_swap/view/user_info/components/custom_upload_widget.dart';

class AddSkillScreen extends StatelessWidget {
  const AddSkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddSkillControllerImpl addSkillControllerImpl =
        Get.put(AddSkillControllerImpl());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(S.of(context).addSkill),
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
                        hintText: S.of(context).mySkillServicePlaceholder,
                        controller: addSkillControllerImpl.mySkill,
                        validator: (value) {
                          return validInput(value!, 3, 50, "text");
                        },
                      ),
                      const SizedBox(height: 20),
                      AppTextFormField(
                        hintText: S.of(context).desiredSkillPlaceholder,
                        controller: addSkillControllerImpl.skillNeeded,
                        validator: (value) {
                          return validInput(value!, 3, 50, "text");
                        },
                      ),
                      const SizedBox(height: 20),
                      GetBuilder<AddSkillControllerImpl>(
                        builder: (controller) => CustomUploadWidget(
                          url: addSkillControllerImpl.url,
                          onPressed: () {
                            controller.getImageFromGallery();
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: AnimatedToggle(
                            values: [
                              S.of(context).online,
                              S.of(context).inPerson,
                            ],
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
                          buttonText: S.of(context).post,
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
    );
  }
}
