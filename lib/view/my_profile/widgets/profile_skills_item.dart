import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileSkillsItem extends StatelessWidget {
  const CustomProfileSkillsItem({
    super.key,
    required this.image,
    required this.skill,
  });
  final String image;
  final String skill;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.sp,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
        Text(
          skill,
        ),
      ],
    );
  }
}
