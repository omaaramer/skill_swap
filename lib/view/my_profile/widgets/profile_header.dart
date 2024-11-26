import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_fading_widget.dart';
import 'package:skill_swap/view/home_page/widgets/card_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.sp,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: GetX<GetUserControllerImpl>(
                init: GetUserControllerImpl(),
                builder: (controller) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: 140.sp,
                      imageUrl: controller.user.value!.profileCoverImage!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CustomFadingWidget(
                        child: Container(
                          width: double.infinity,
                          height: 140.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                }),
          ),
          GetX<GetUserControllerImpl>(builder: (controller) {
            return CircleAvatar(
              radius: 62.sp,
              backgroundColor: AppColors.background,
              child: CircleAvatar(
                radius: 60.sp,
                backgroundImage: NetworkImage(
                  controller.user.value!.profileImageUrl,
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
