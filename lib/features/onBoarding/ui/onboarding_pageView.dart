import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/features/onBoarding/data/static/static.dart';
import 'package:skill_swap/features/onBoarding/ui/customslider.dart';
import 'package:skill_swap/features/onBoarding/ui/dot_indicator.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300,
                    ),
                    child: const Text("Skip"),
                  )
                ],
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: AppTextButton(
                          backgroundColor: AppColors.primary,
                          buttonText: 'Continue',
                          textStyle: const TextStyle(color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
