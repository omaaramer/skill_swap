import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/data/models/post_model.dart';
import 'package:skill_swap/data/models/reciever_model.dart';
import 'package:skill_swap/data/models/swap_request_model.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:skill_swap/view/chat/chat_screen.dart';
import 'swap_button.dart';

class CardBottomIconBar extends StatelessWidget {
  const CardBottomIconBar(
      {super.key,
      required this.userModel,
      required this.postModel,
      required this.reciever});
  final UserModel userModel;
  final SkillModel postModel;
  final RecieverModel reciever;
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
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: userController.user!.profileImageUrl,
                  height: 25,
                  width: 25,
                  fit: BoxFit.cover,
                  // placeholder: (context, url) {
                  //   return CustomFadingWidget(
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(100),
                  //           color: Colors.grey),
                  //     ),
                  //   );
                  // },
                ),
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
                Text("Connect", style: TextStyle(fontSize: 13.sp)),
              ],
            )),
        SwapButton(
          userModel: userModel,
          postModel: postModel,
          reciever: reciever,
        ),
      ],
    );
  }
}
