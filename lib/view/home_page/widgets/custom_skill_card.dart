import 'package:flutter/material.dart';
import 'package:skill_swap/data/models/post_model.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:skill_swap/view/home_page/widgets/bottom_icon_bar.dart';
import 'package:skill_swap/view/home_page/widgets/card_infi_bar.dart';
import 'package:skill_swap/view/home_page/widgets/custom_divider.dart';
import 'card_image.dart';
import 'card_user_info_listile.dart';
import 'skill_listile.dart';

class SkillDetailsCard extends StatelessWidget {
  const SkillDetailsCard({
    super.key,
    required this.userModel,
    required this.postModel,
  });

  final UserModel userModel;
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: SizedBox(
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 20,
              child: ListView(
                children: [
                  CustomUserLisTile(
                    name: userModel.fullname,
                    jopTitle: userModel.jopTitle,
                    imageUrl: userModel.profileImageUrl,
                  ),
                  const CustomCardDivider(),
                  CustomSkillLisTile(
                    title: 'WILL OFFER YOU',
                    skill: postModel.mySkill!,
                    isOnline: postModel.isOnline,
                  ),
                  const CustomCardDivider(
                    endIndent: 20,
                    indent: 16,
                  ),
                  CustomSkillLisTile(
                    title: 'IN EXPECTATION FOR',
                    skill: postModel.skillNeeded!,
                    isOnline: postModel.isOnline,
                  ),
                  CustomCardImage(
                    imageUrl: postModel.skillImage!,
                  ),
                  const SizedBox(height: 10),
                  CardInfoBar(address: userModel.address),
                  const CustomCardDivider(),
                  CardBottomIconBar(userModel: userModel, postModel: postModel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
