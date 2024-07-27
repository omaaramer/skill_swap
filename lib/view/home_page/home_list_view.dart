import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/controller/Add%20Skills/get_skill_post_data_controller.dart';
import 'package:skill_swap/view/home_page/custom_swap_card.dart';

class HomePageListView extends StatelessWidget {
  const HomePageListView({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = Get.put(GetSkillPostDataControllerImpl());

    return Obx(() {
      if (postController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (postController.posts.isEmpty) {
        return const Center(child: Text('No posts available'));
      }

      return ListView.builder(
        itemCount: postController.posts.length,
        itemBuilder: (context, index) {
          final post = postController.posts[index];
          return PostCard(
            userName: post.username,
            address: post.userAddress,
            userImageUrl: post.profileImage,
            skillImageUrl: post.skillImage,
            mySkill: post.mySkill,
            skillNedded: post.skillNeeded,
            isOnline: post.isOnline,
          );
        },
      );
    });
  }
}
