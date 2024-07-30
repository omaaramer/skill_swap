import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';

class CustomSkillLisTile extends StatelessWidget {
  const CustomSkillLisTile(
      {super.key,
      required this.title,
      required this.skill,
      required this.isOnline});
  final String title, skill;
  final String isOnline;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                  isOnline,
                  style: AppStyle.stylerBold20(context).copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
          Text(
            skill,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontSize: 13.sp),
          ),
        ],
      ),
    );
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
              isOnline,
              style: AppStyle.stylerBold20(context).copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
      subtitle: Text(
        skill,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(fontSize: 13.sp),
      ),
    );
  }
}
