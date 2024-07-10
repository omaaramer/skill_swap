import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/onboarding_controller.dart';
import 'package:skill_swap/core/helpers/extentions.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/view/onBoarding/widget/custom_button.dart';
import 'package:skill_swap/view/onBoarding/customslider.dart';
import 'package:skill_swap/view/onBoarding/widget/dot_indicator.dart';
import 'package:skill_swap/view/welcome_screen/regester_button.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpl());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomSmallButton(
                text: "Skip",
                color: Colors.black,
                backgroundColor: Colors.grey.shade300,
                onPressed: () {
                  context.pushNamed(Routes.welcomeScreen);
                },
              ),
              const Expanded(
                flex: 4,
                child: CustomSliderOnBoarding(),
              ),
              const Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      DotIndicator(),
                      OnBoardingButton(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// late PageController pageController;
//   int currentIndex = 0;
//   @override
//   void initState() {
//     pageController = PageController();
//     pageController.addListener(() {
//       currentIndex = pageController.page!.round();

//       setState(() {});
//     });
//     super.initState();
//   }