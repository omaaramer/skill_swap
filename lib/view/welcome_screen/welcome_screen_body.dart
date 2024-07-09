import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/app_style.dart';
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
        Text("Let’s  Get", style: AppStyle.styleBold50(context)),
        Text("Started", style: AppStyle.styleBold50(context)),
        const SizedBox(height: 20),
        Text(
          "Unlock a world of limitless skills and knowledge with our free skill swapping app, where sharing is caring!",
          textAlign: TextAlign.center,
          style: AppStyle.styleRegular16Grey(context)
              .copyWith(color: Colors.white),
        ),
        const SizedBox(height: 20),
        const RegesterationButtons(),
        const SizedBox(height: 32),
      ],
    );
  }
}
