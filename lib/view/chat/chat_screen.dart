import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/chat/chat_controller.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:skill_swap/view/chat/widgets/chat_listview.dart';
import 'package:skill_swap/view/chat/widgets/chat_user_item.dart';
import 'package:skill_swap/view/chat/widgets/widget_textfield.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.userModel});
  final UserModel userModel;
  final ChatControllerImpl chatController = Get.put(ChatControllerImpl());
  // final ScrollController listViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          titleSpacing: 0,
          title: ChatUserItem(
            image: userModel.profileImageUrl,
            name: userModel.fullname,
            radius: 18.sp,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatListView(chatController: chatController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChatTextFormField(
                controller: chatController.messageController,
                onPressed: () {
                  chatController.sendMessage(receiverId: userModel.userId);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
