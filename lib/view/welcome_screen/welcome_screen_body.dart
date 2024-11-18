import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/generated/l10n.dart';
import 'package:skill_swap/view/welcome_screen/regester_button.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: Text(
            S.of(context).start,
            style: AppStyle.styleBold50(context),
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            softWrap: true,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          S.of(context).introMessage,
          textAlign: TextAlign.center,
          style: AppStyle.styleRegular16Grey(context)
              .copyWith(color: AppColors.white),
        ),
        const SizedBox(height: 20),
        const RegesterationButtons(),
        const SizedBox(height: 32),
      ],
    );
  }
}
