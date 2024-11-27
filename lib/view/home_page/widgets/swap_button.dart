import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:skill_swap/controller/posts/send_swap_controller.dart';
import 'package:skill_swap/data/models/post_model.dart';
import 'package:skill_swap/data/models/reciever_model.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:skill_swap/generated/l10n.dart';
import 'show_swap_bottom_sheet.dart';

class SwapButton extends StatelessWidget {
  const SwapButton(
      {super.key, required this.userModel, required this.reciever});
  final UserModel userModel;
  // final SkillModel postModel;
  final RecieverModel reciever;
  @override
  Widget build(BuildContext context) {
    SendSwapControllerImpl sendSwapController = Get.put(SendSwapControllerImpl(
      userModel: userModel,
    ));
    return IconButton(
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
              Text(S.of(context).swap, style: TextStyle(fontSize: 13.sp)),
            ],
          ),
        ],
      ),
      onPressed: () {
        showSwapSkillBottomSheet(context, (SkillModel selectedSkill) {
          sendSwapController.sendSwapRequest(
            skillModel: selectedSkill,
            receiver: reciever,
          );
          Get.back();
        });
      },
    );
  }
}
