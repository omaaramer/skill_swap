import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';

class CustomUserLisTile extends StatelessWidget {
  const CustomUserLisTile(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.jopTitle});
  final String name, jopTitle, imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name, style: AppStyle.blackTitle(context)),
                  SizedBox(width: 5.w),
                  Icon(Icons.check_circle,
                      color: AppColors.primary, size: 13.sp),
                ],
              ),
              Text(jopTitle, style: TextStyle(fontSize: 13.sp)),
            ],
          ),
          CircleAvatar(
            radius: 25.sp,
            backgroundImage: NetworkImage(imageUrl),
          )
        ],
      ),
    );
  }
}
