import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_skill_post_data_controller.dart';
import 'package:skill_swap/data/models/post_model.dart';
import 'package:skill_swap/generated/l10n.dart';

class SwapSkillBottomSheet extends StatelessWidget {
  final Function(SkillModel) onSkillSelected;

  const SwapSkillBottomSheet({super.key, required this.onSkillSelected});

  @override
  Widget build(BuildContext context) {
    final skillsController = Get.find<GetSkillPostDataControllerImpl>();

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.all(16),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).chooseSkill,
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
                          skill.userId ==
                          FirebaseAuth.instance.currentUser!.uid)
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
        ],
      ),
    );
  }
}
