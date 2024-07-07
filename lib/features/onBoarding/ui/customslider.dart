import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/features/onBoarding/data/static/static.dart';

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
            style: AppStyle.styleBold22(context),
          ),
          const SizedBox(height: 20),
          Text(onBoardingList[i].description,
              textAlign: TextAlign.center,
              style: AppStyle.styleRegular14Grey(context)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
