import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/view/auth/widgets/divider.dart';
import 'package:skill_swap/view/home_page/widgets/bottom_icon_bar.dart';
import 'package:skill_swap/view/home_page/widgets/custom_divider.dart';
import 'widgets/card_image.dart';
import 'widgets/card_user_info_listile.dart';
import 'widgets/skill_listile.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        height: 510,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
        ),
        child: const Column(
          children: [
            CustomUserLisTile(
              name: 'Omar Amer',
              address: ' Cairo, Egypt',
              imageUrl: Assets.imagesOmaar,
            ),
            CustomCardDivider(),
            SizedBox(height: 10),
            CustomCardImage(
              imageUrl: Assets.imagesDownload,
            ),
            CustomSkillLisTile(
              title: 'WILL OFFER YOU',
              skill: ' Flutter Developer',
              isOnline: true,
            ),
            CustomCardDivider(
              endIndent: 20,
              indent: 16,
            ),
            CustomSkillLisTile(
              title: 'IN EXPECTATION FOR',
              skill: ' Music Production',
              isOnline: false,
            ),
            CustomCardDivider(),
            CardBottomIconBar()
          ],
        ),
      ),
    );
  }
}
