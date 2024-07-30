import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/theming/colores.dart';

class CardInfoBar extends StatelessWidget {
  const CardInfoBar({super.key, required this.address});
  final String address;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(IconBroken.Location,
                    color: AppColors.primary, size: 18.sp),
                Text(
                  address,
                  style: TextStyle(fontSize: 13.sp),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.language_outlined,
                    color: AppColors.primary.withOpacity(.8), size: 18.sp),
                Text(
                  "Arabic",
                  style: TextStyle(fontSize: 13.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
