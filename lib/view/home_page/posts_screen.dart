import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/view/home_page/widgets/home_list_view.dart';

import '../../controller/Add Skills/get_skill_post_data_controller.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = Get.put(GetSkillPostDataControllerImpl());
    return Column(
      children: [
        // HomePageHeader(),
        Expanded(
            child: RefreshIndicator(
          onRefresh: () async {
            postController.getPosts();
          },
          child: HomePageListView(postController: postController),
        )),
      ],
    );
  }
}
