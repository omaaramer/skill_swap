import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_skill_post_data_controller.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/view/home_page/widgets/custom_swap_card.dart';
import 'swap_card_loading_indicator.dart';

class HomePageListView extends StatelessWidget {
  const HomePageListView({super.key, required this.postController});
  final String defaultImageUrl = Assets.imagesPlaceholder;
  final GetSkillPostDataControllerImpl postController;
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(GetUserControllerImpl());
    return Obx(() {
      const PostCardLiadingIndicator();

      return ListView.builder(
        itemCount: postController.posts.length,
        itemBuilder: (context, index) {
          final post = postController.posts[index];

          // Use .where() and check if it's not empty to avoid errors
          final matchingUsers = userController.userList
              .where(
                (user) => user.userId == post.userId,
              )
              .toList();

          // Check if there is at least one matching user
          if (postController.posts.isEmpty) {
            return Center(
              child: Text(
                "No Posts Available",
                style: AppStyle.blackTitle(context),
              ),
            );
          }

          // Get the first matching user
          final user = matchingUsers.first;
          return PostCard(
            userModel: user,
            postModel: post,
          );
        },
      );
    });
  }
}
