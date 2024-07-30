import 'package:flutter/material.dart';
import 'package:skill_swap/view/home_page/widgets/home_list_view.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // HomePageHeader(),
        Expanded(child: HomePageListView()),
      ],
    );
  }
}
