import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:skill_swap/view/chat/chat_screen.dart';

class CardBottomIconBar extends StatelessWidget {
  const CardBottomIconBar({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    GetUserControllerImpl userController = Get.find();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
          onPressed: () {},
          child: Row(
            children: [
              CircleAvatar(
                radius: 16.sp,
                backgroundImage:
                    NetworkImage(userController.user!.profileImageUrl),
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
              if (userController.user!.userId != userModel.userId) {
                Get.to(() => ChatScreen(userModel: userModel));
              }
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
