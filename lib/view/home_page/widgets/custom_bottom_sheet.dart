import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_skill_post_data_controller.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/data/models/post_model.dart';

class SwapSkillBottomSheet extends StatelessWidget {
  final Function(SkillModel) onSkillSelected;

  const SwapSkillBottomSheet({super.key, required this.onSkillSelected});

  @override
  Widget build(BuildContext context) {
    final skillsController = Get.find<GetSkillPostDataControllerImpl>();

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose a Skill to Swap',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() {
              if (skillsController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              final mySkillsList = skillsController.allSkills
                  .where((skill) =>
                      skill.userId == FirebaseAuth.instance.currentUser!.uid)
                  .toList();
              if (mySkillsList.isEmpty) {
                return const Center(
                    child: Text(
                        "You have no skills available, add Skills first!"));
              }

              return ListView.builder(
                itemCount: mySkillsList.length,
                itemBuilder: (context, index) {
                  SkillModel mySkill = mySkillsList[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(mySkill.mySkill!),
                      onTap: () {
                        onSkillSelected(mySkill);
                        // Get.back(); // Close the bottom sheet
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
