import 'package:flutter/material.dart';
import 'package:skill_swap/data/static/onboarding_static_data.dart';
import 'package:skill_swap/view/features/onBoarding/Screen/custom_dot.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.currentPageIndex});
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          onBoardingList.length,
          (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomDot(isActive: index == currentPageIndex),
              )),
    );
  }
}
