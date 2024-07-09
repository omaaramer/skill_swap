import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_swap/core/helpers/extentions.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/data/static/onboarding_static_data.dart';
import 'package:skill_swap/view/features/onBoarding/Screen/custom_button.dart';
import 'package:skill_swap/view/features/onBoarding/Screen/customslider.dart';
import 'package:skill_swap/view/features/onBoarding/Screen/dot_indicator.dart';
import 'package:skill_swap/view/features/welcome_screen/regester_button.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                flex: 4,
                child: CustomSliderOnBoarding(pageController: pageController),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      DotIndicator(currentPageIndex: currentIndex),
                      OnBoardingButton(
                          currentIndex: currentIndex,
                          pageController: pageController),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
