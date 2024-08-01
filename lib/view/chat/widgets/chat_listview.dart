import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/chat/chat_controller.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:skill_swap/view/chat/widgets/widget_chat_bubble.dart';

class ChatListView extends GetView<ChatControllerImpl> {
  const ChatListView({
    super.key,
    required this.chatController,
  });

  final ChatControllerImpl chatController;
  // final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Obx(() {
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: chatController.messages.length,
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemBuilder: (context, index) {
              var messages = chatController.messages[index];
              if (messages.senderId == FirebaseAuth.instance.currentUser!.uid) {
                return ChatBubble(
                    message: messages.message, time: messages.time);
              } else {
                return ChatBubbleForFriend(
                  time: messages.time,
                  message: messages.message,
                );
              }
            });
      });
    });
  }
}
