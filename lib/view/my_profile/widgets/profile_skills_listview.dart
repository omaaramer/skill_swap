import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_skill_post_data_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/view/my_profile/widgets/profile_skills_item.dart';

class ProfileSkillsListView extends StatelessWidget {
  const ProfileSkillsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final skillsController = Get.find<GetSkillPostDataControllerImpl>();

    final mySkillsList = skillsController.allSkills.where(
        (skill) => skill.userId == FirebaseAuth.instance.currentUser!.uid);

    if (mySkillsList.isEmpty) {
      return Center(
          child: Text(
        'add skills to enhance your profile',
        style: AppStyle.styleRegular16Grey(context),
      ));
    }

    return ListView.separated(
      itemCount: mySkillsList.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CustomProfileSkillsItem(
          image: mySkillsList.elementAt(index).skillImage!,
          skill: mySkillsList.elementAt(index).mySkill!,
        );
      },
    );
  }
}
