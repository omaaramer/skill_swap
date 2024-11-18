import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class HaveAcountWidget extends StatelessWidget {
  const HaveAcountWidget(
      {super.key,
      required this.text,
      required this.textButton,
      this.onPressed});
  final String text, textButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: AppStyle.styleRegular16Grey(context).copyWith(fontSize: 16)),
        TextButton(
          onPressed: () {},
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              textButton,
              style: AppStyle.styleBold26(context).copyWith(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
