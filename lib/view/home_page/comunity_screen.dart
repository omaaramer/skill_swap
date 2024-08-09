import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';

class SwapRequestesScreen extends StatelessWidget {
  const SwapRequestesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(height: 2),
        itemBuilder: (context, index) => const CustomSwapRequsetItem());
  }
}

class CustomSwapRequsetItem extends StatelessWidget {
  const CustomSwapRequsetItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
          color: const Color(0xFFDCCEF8),
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
                  imageUrl:
                      "https://fps.cdnpk.net/photos/home/cover_v3.webp?w=1500",
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
                            Text("Omar Amer",
                                style: AppStyle.blackTitle(context)),
                            Text('Flutter developer',
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
                        const CustomSkillContainer(),
                        Transform.rotate(
                          angle: 90 *
                              (3.14159 / 180), // Convert degrees to radians
                          child: Icon(
                            IconBroken.Swap,
                            size: 20.sp, // Color of the icon
                          ),
                        ),
                        const CustomSkillContainer(),
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

class CustomSkillContainer extends StatelessWidget {
  const CustomSkillContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
          child: Text(
            "Flutter developer - Flutter developer Flutter developer",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}
