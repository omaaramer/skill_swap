import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/view/home_page/widgets/card_image.dart';

import '../../controller/Add Skills/get_user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    GetUserControllerImpl userController = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 170.sp,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      CustomCardImage(
                        height: 140.sp,
                        imageUrl:
                            "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 16.sp,
                          backgroundColor: Colors.white24,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(IconBroken.Camera, size: 20.sp)),
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 62.sp,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 60.sp,
                        backgroundImage: NetworkImage(
                          userController.user!.profileImageUrl,
                        ),
                      ),
                      CircleAvatar(
                        radius: 16.sp,
                        backgroundColor: Colors.white38,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(IconBroken.Camera, size: 20.sp)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(userController.user!.fullname,
              style: AppStyle.blackTitle(context)),
          Text("write your bio here...",
              style: AppStyle.styleRegular16Grey(context)),
        ],
      ),
    );
  }
}
