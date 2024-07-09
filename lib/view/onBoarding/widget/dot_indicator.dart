import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/onboarding_controller.dart';
import 'package:skill_swap/data/static/onboarding_static_data.dart';
import 'package:skill_swap/view/onBoarding/widget/custom_dot.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImpl>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  onBoardingList.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CustomDot(
                            isActive: index == controller.currentPageIndex),
                      )),
            ));
  }
}
