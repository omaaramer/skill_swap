import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/controller/Add%20Skills/get_skill_post_data_controller.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
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
      if (postController.isLoading.value) {
        return PostCardLiadingIndicator();
      }

      // if (postController.posts.isEmpty) {
      //   return const Center(child: Text('No posts available'));
      // }

      return ListView.builder(
        itemCount: postController.posts.length,
        itemBuilder: (context, index) {
          final post = postController.fetchPosts()[index];
          final user = userController.userList.firstWhere(
            (user) => user.userId == post.skillId,
          );

          return PostCard(
            userModel: user,
            postModel: post,
          );
        },
      );
    });
  }
}
