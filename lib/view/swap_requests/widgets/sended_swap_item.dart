import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/data/models/swap_request_model.dart';
import 'package:skill_swap/generated/l10n.dart';

import 'user_listile.dart';

class SendedSwaps extends StatelessWidget {
  const SendedSwaps({super.key, required this.swapRequest});
  final SwapRequest swapRequest;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 1,
        child: Container(
          height: 150.h,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: swapRequest.receiverImage,
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
                      UserLIstile(
                        userName: swapRequest.receiverName,
                        userJopTitle: swapRequest.receiverJopTitle,
                      ),
                      const Divider(height: 2),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).inExpectationFor,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.lightBlack,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            swapRequest.receiverSkill,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      AppTextButton(
                          borderRadius: 12,
                          verticalPadding: 0,
                          buttonHeight: 30.h,
                          buttonText: "Cancel",
                          textStyle: AppStyle.stylerBold20(context),
                          onPressed: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
