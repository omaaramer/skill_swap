import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_skill_post_data_controller.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/view/home_page/widgets/custom_swap_card.dart';
import 'swap_card_loading_indicator.dart';

class HomePageListView extends StatelessWidget {
  const HomePageListView({super.key, required this.postController});
  final GetSkillPostDataControllerImpl postController;

  @override
  Widget build(BuildContext context) {
    // Initializing userController to manage user data
    final userController = Get.put(GetUserControllerImpl());

    return Obx(() {
      // Display loading indicator if data is still loading
      if (postController.isLoading.value) {
        return const PostCardLiadingIndicator();
      }

      // Handle case when there are no posts
      if (postController.postSkills.isEmpty) {
        return Center(
          child: Text(
            'No posts available', // Message to display when no posts
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
      }

      // Display list of posts if data is loaded and not empty
      return ListView.builder(
        itemCount: postController.postSkills.length,
        itemBuilder: (context, index) {
          final post = postController.postSkills[index];

          // Find the user who matches the post's userId
          final matchingUsers = userController.userList
              .where((user) => user.userId == post.userId)
              .toList();

          if (matchingUsers.isNotEmpty) {
            final user = matchingUsers.first;
            return PostCard(
              userModel: user,
              postModel: post,
            );
          } else {
            // Handle case if user is not found for the post
            return Center(
              child: Text(
                'User not found',
                style: TextStyle(fontSize: 16, color: Colors.redAccent),
              ),
            );
          }
        },
      );
    });
  }
}
