import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/generated/l10n.dart';

class ChatTextFormField extends StatelessWidget {
  const ChatTextFormField(
      {super.key, required this.controller, required this.onPressed});
  final TextEditingController controller;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 16.w,
                ),
                hintText: S.of(context).typeMessage,
              ),
            ),
          ),
          Container(
            color: AppColors.primary,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                IconBroken.Send,
                color: Colors.white,
                size: 30.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
