import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';

class CustomSkillLisTile extends StatelessWidget {
  const CustomSkillLisTile(
      {super.key,
      required this.title,
      required this.skill,
      required this.isOnline});
  final String title, skill;
  final bool isOnline;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyle.styleBold18(context)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.primary,
            ),
            child: Text(
              isOnline ? "ONLINE" : "IN PERSON",
              style: AppStyle.stylerBold20(context).copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
      subtitle: Text(
        skill,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
