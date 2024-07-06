import 'package:flutter/material.dart';
import 'package:skill_swap/features/onBoarding/data/static/static.dart';
import 'package:skill_swap/features/onBoarding/ui/custom_dot.dart';

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
