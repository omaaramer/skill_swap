import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/data/static/onboarding_static_data.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Center(
              child: SvgPicture.asset(
                onBoardingList[i].image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            onBoardingList[i].title,
            style: AppStyle.styleBold26(context),
          ),
          const SizedBox(height: 20),
          Text(onBoardingList[i].description,
              textAlign: TextAlign.center,
              style: AppStyle.styleRegular16Grey(context)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
