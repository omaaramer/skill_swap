import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/view/chat/chat_screen.dart';
import 'package:skill_swap/view/chat/widgets/chat_user_item.dart';

class ChatHomePage extends StatelessWidget {
  ChatHomePage({super.key});
  final GetUserControllerImpl userController = Get.put(GetUserControllerImpl());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentUserId = FirebaseAuth.instance.currentUser!.uid;
      final filteredUserList = userController.userList
          .where((user) => user.userId != currentUserId)
          .toList();

      return ListView.separated(
        itemCount: filteredUserList.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          var user = filteredUserList[index];
          return ChatUserItem(
            name: user.fullname,
            image: user.profileImageUrl,
            onPressed: () {
              Get.to(() => ChatScreen(userModel: user), arguments: user.userId);
            },
          );
        },
      );
    });
  }
}
