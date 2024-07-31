import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/routing/routes.dart';

class CardBottomIconBar extends StatelessWidget {
  const CardBottomIconBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                style: TextStyle(fontSize: 11.sp),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              Get.toNamed(Routes.chatScreen);
            },
            icon: Row(
              children: [
                const Icon(IconBroken.Chat, size: 20),
                Text("Chat", style: TextStyle(fontSize: 13.sp)),
              ],
            )),
        Center(
          child: IconButton(
            icon: Row(
              children: [
                Row(
                  children: [
                    Transform.rotate(
                      angle: 90 * (3.14159 / 180), // Convert degrees to radians
                      child: Icon(
                        IconBroken.Swap,
                        size: 20.sp, // Color of the icon
                      ),
                    ),
                    Text("Swap", style: TextStyle(fontSize: 13.sp)),
                  ],
                ),
              ],
            ),
            onPressed: () {
              Get.defaultDialog(
                title: "Swap",
                content: const Text("Send a Swap Request?"),
                confirm: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Yes"),
                ),
                cancel: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("No"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
