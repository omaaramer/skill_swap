import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class UserLIstile extends StatelessWidget {
  const UserLIstile({
    super.key,
    required this.userName,
    required this.userJopTitle,
    this.onPressed,
  });

  final String userName, userJopTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName, style: AppStyle.blackTitle(context)),
            Text(userJopTitle, style: TextStyle(fontSize: 13.sp)),
          ],
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
