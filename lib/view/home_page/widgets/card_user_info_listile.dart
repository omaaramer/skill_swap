import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class CustomUserLisTile extends StatelessWidget {
  const CustomUserLisTile(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.address});
  final String name, address, imageUrl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name, style: AppStyle.styleBold18(context)),
      subtitle: Text(address, style: AppStyle.styleRegular16Grey(context)),
      trailing: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(imageUrl)),
        ),
      ),
    );
  }
}
