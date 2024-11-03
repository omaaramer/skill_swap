import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/data/models/swap_request_model.dart';
import 'package:skill_swap/view/swap_requests/widgets/skill_container.dart';

class CustomSwapRequsetItem extends StatelessWidget {
  const CustomSwapRequsetItem({super.key, required this.swapRequest});
  final SwapRequest swapRequest;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: swapRequest.senderImage,
                  // height: 140.h,
                  height: double.infinity,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(swapRequest.senderName,
                                style: AppStyle.blackTitle(context)),
                            Text(swapRequest.senderJopTitle,
                                style: TextStyle(fontSize: 13.sp)),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.more_vert))
                      ],
                    ),
                    const Divider(height: 2),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSkillContainer(skill: swapRequest.senderSkill),
                        Transform.rotate(
                          angle: 90 *
                              (3.14159 / 180), // Convert degrees to radians
                          child: Icon(
                            IconBroken.Swap,
                            size: 20.sp, // Color of the icon
                          ),
                        ),
                        CustomSkillContainer(
                          skill: swapRequest.receiverSkill,
                        ),
                      ],
                    ),
                    const Spacer(),
                    AppTextButton(
                        borderRadius: 12,
                        verticalPadding: 0,
                        buttonHeight: 30.h,
                        buttonText: "Swap",
                        textStyle: AppStyle.stylerBold20(context),
                        onPressed: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
