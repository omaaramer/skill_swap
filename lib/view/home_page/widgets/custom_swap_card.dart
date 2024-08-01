import 'package:flutter/material.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:skill_swap/view/home_page/widgets/bottom_icon_bar.dart';
import 'package:skill_swap/view/home_page/widgets/card_infi_bar.dart';
import 'package:skill_swap/view/home_page/widgets/custom_divider.dart';
import 'card_image.dart';
import 'card_user_info_listile.dart';
import 'skill_listile.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.userName,
    required this.address,
    required this.userImageUrl,
    required this.skillImageUrl,
    required this.mySkill,
    required this.skillNedded,
    required this.isOnline,
    required this.jopTitle,
    required this.userModel,
  });
  final String userName,
      address,
      userImageUrl,
      skillImageUrl,
      mySkill,
      jopTitle,
      isOnline,
      skillNedded;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed(Routes.detailedPostCard);
        },
        child: Container(
          width: double.infinity,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(8),
          // ),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 20,
            child: Column(
              children: [
                CustomUserLisTile(
                  name: userName,
                  jopTitle: jopTitle,
                  imageUrl: userImageUrl,
                ),
                const CustomCardDivider(),
                CustomSkillLisTile(
                  title: 'WILL OFFER YOU',
                  skill: mySkill,
                  isOnline: isOnline,
                ),
                const CustomCardDivider(
                  endIndent: 20,
                  indent: 16,
                ),
                CustomSkillLisTile(
                  title: 'IN EXPECTATION FOR',
                  skill: skillNedded,
                  isOnline: isOnline,
                ),
                CustomCardImage(
                  imageUrl: skillImageUrl,
                ),
                const SizedBox(height: 10),
                CardInfoBar(address: address),
                const CustomCardDivider(),
                CardBottomIconBar(userModel: userModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
