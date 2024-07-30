import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';

class CardBottomIconBar extends StatelessWidget {
  const CardBottomIconBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
          onPressed: () {},
          child: Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
              ),
              SizedBox(width: 8.w),
              Text(
                "Write a Comment...",
                style: TextStyle(fontSize: 13.sp),
              ),
            ],
          ),
        ),
        Center(
          child: Transform.rotate(
              angle: 90 * (3.14159 / 180), // Convert degrees to radians
              child: IconButton(
                icon: Icon(
                  IconBroken.Swap,
                  size: 22.sp, // Color of the icon
                ),
                onPressed: () {},
              )),
        ),
        IconButton(onPressed: () {}, icon: const Icon(IconBroken.Chat)),
      ],
    );
  }
}
