import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/view/home_page/widgets/card_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.userController,
  });

  final GetUserControllerImpl userController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.sp,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: CustomCardImage(
              height: 140.sp,
              imageUrl:
                  "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
            ),
          ),
          CircleAvatar(
            radius: 62.sp,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: CircleAvatar(
              radius: 60.sp,
              backgroundImage: NetworkImage(
                userController.user.value!.profileImageUrl,
              ),
            ),
          )
        ],
      ),
    );
  }
}
