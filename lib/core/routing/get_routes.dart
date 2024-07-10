import 'package:flutter/material.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/view/auth/sign_in_screen.dart';
import 'package:skill_swap/view/auth/sign_up_screen.dart';
import 'package:skill_swap/view/onBoarding/Screen/onboarding_pageView.dart';
import 'package:skill_swap/view/welcome_screen/welcome_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Routes.onBoardingScrreen: (context) => const OnBoardingPageView(),
  Routes.welcomeScreen: (context) => const WelcomeScreen(),
  Routes.signInScreen: (context) => const SignInScreen(),
  Routes.signUpScreen: (context) => const SignUpScreen(),
};