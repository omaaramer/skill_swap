import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/data/models/post_model.dart';
import 'package:skill_swap/data/models/reciever_model.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:skill_swap/generated/l10n.dart';
import 'package:skill_swap/view/home_page/widgets/bottom_icon_bar.dart';
import 'package:skill_swap/view/home_page/widgets/card_infi_bar.dart';
import 'package:skill_swap/view/home_page/widgets/custom_divider.dart';
import 'card_image.dart';
import 'card_user_info_listile.dart';
import 'custom_skill_card.dart';
import 'skill_listile.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.userModel,
    required this.postModel,
  });

  final UserModel userModel;
  final SkillModel postModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 20,
          child: Column(
            children: [
              CustomUserLisTile(
                name: userModel.fullname,
                jopTitle: userModel.jobTitle,
                imageUrl: userModel.profileImageUrl,
              ),
              const CustomCardDivider(),
              CustomSkillLisTile(
                title: S.of(context).willOfferYou,
                skill: postModel.mySkill!,
                isOnline: postModel.isOnline
                    ? S.of(context).online
                    : S.of(context).inPerson,
                descreptionMaxLines: 10,
              ),
              const CustomCardDivider(
                endIndent: 20,
                indent: 16,
              ),
              CustomSkillLisTile(
                title: S.of(context).inExpectationFor,
                skill: postModel.skillNeeded!,
                isOnline: postModel.isOnline
                    ? S.of(context).online
                    : S.of(context).inPerson,
                descreptionMaxLines: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SkillDetailsCard(
                        userModel: userModel,
                        postModel: postModel,
                      ));
                },
                child: CustomCardImage(
                  height: 250,
                  imageUrl: postModel.skillImage!,
                ),
              ),
              const SizedBox(height: 10),
              CardInfoBar(address: userModel.address),
              const CustomCardDivider(),
              CardBottomIconBar(
                userModel: userModel,
                postModel: postModel,
                reciever: RecieverModel(
                  receiverImage: userModel.profileImageUrl,
                  receiverJopTitle: userModel.jobTitle,
                  receiverId: userModel.userId,
                  receiverName: userModel.fullname,
                  skillId: postModel.skillId!,
                  skill: postModel.mySkill!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
