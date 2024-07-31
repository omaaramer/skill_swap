import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class ChatHomePage extends StatelessWidget {
  ChatHomePage({super.key});
  final userController = Get.put(GetUserControllerImpl());
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // physics: const BouncingScrollPhysics(),
      itemCount: userController.userList.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => ChatItem(
        name: userController.userList[index].fullname,
        image: userController.userList[index].profileImageUrl,
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.image, required this.name});
  final String image, name;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Row(
        children: [
          CircleAvatar(
            radius: 22.sp,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: AppStyle.blackTitle(context),
          ),
        ],
      ),
    );
  }
}
