import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class ChatUserItem extends StatelessWidget {
  const ChatUserItem(
      {super.key,
      required this.image,
      required this.name,
      this.onPressed,
      this.radius});
  final String image, name;
  final void Function()? onPressed;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Row(
        children: [
          CircleAvatar(
            radius: radius ?? 22.sp,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppStyle.blackTitle(context),
              ),
              // const SizedBox(height: 5),
              const Text('Online'),
            ],
          ),
        ],
      ),
    );
  }
}
