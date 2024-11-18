import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/localization/change_local.dart';
import 'package:skill_swap/core/localization/is_arabic.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/widgets/custom_redues_button.dart';
import 'package:skill_swap/generated/l10n.dart';

class RegesterationButtons extends StatelessWidget {
  const RegesterationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: S.of(context).signIn,
            bottomRightradius: 8,
            topLeftRadius: MyFunctions.isArabic() ? 32 : 8,
            bottomLeftRadius: 8,
            topRightRadius: MyFunctions.isArabic() ? 8 : 32,
            onPressed: () {
              Get.offAllNamed(Routes.signInScreen);
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            text: S.of(context).signUp,
            bottomRightradius: 8,
            topLeftRadius: MyFunctions.isArabic() ? 8 : 32,
            bottomLeftRadius: 8,
            topRightRadius: MyFunctions.isArabic() ? 32 : 8,
            onPressed: () {
              Get.offAllNamed(Routes.signUpScreen);
            },
          ),
        ),
      ],
    );
  }
}
