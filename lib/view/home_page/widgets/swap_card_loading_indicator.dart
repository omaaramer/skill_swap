import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_swap/core/widgets/custom_fading_widget.dart';

import 'package:skill_swap/view/home_page/widgets/custom_divider.dart';

class PostCardLiadingIndicator extends StatelessWidget {
  const PostCardLiadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const Color color = Colors.grey;
    return CustomFadingWidget(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const UserListileLoadingIndgiator(color: color),
                const CustomCardDivider(),
                const SkillLoadingIndicator(color: color),
                const CustomCardDivider(
                  endIndent: 20,
                  indent: 16,
                ),
                const SkillLoadingIndicator(
                  color: color,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SkillLoadingIndicator extends StatelessWidget {
  const SkillLoadingIndicator({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                width: 100,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                height: 20,
                width: 100,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            height: 15,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}

class UserListileLoadingIndgiator extends StatelessWidget {
  const UserListileLoadingIndgiator({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
              )),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
                width: 100,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 10,
                width: 100,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
    );
  }
}
