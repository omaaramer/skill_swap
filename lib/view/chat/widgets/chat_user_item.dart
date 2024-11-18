import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class ChatUserItem extends StatelessWidget {
  const ChatUserItem(
      {super.key,
      required this.image,
      required this.name,
      this.onPressed,
      this.radius});
  final String image, name;
  final void Function()? onPressed;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: image,
                height: 50,
                width: 50,
              )),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppStyle.blackTitle(context),
              ),
              // const SizedBox(height: 5),
              const Text('Online'),
            ],
          ),
        ],
      ),
    );
  }
}
