import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:skill_swap/controller/profile/profile_page_view_controller.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/view/edit_profile/edit_profile_pageview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmothIndicator extends StatelessWidget {
  const SmothIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageViewControllerImpl>(
      builder: (controller) => SmoothPageIndicator(
        controller: controller.pageController, // PageController
        count: EditProfilePageview.pages.length,
        effect: const JumpingDotEffect(
          activeDotColor: AppColors.primary,
          spacing: 20,
          verticalOffset: 20,
        ), // your preferred effect
      ),
    );
  }
}
