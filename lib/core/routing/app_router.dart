import 'package:flutter/material.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/view/features/auth/sign_in_screen.dart';
import 'package:skill_swap/view/features/auth/sign_up_screen.dart';
import 'package:skill_swap/view/features/onBoarding/Screen/onboarding_pageView.dart';
import 'package:skill_swap/view/features/welcome_screen/welcome_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScrreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingPageView());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
              body: Center(
            child: Text('No route defined for ${settings.name}'),
          )),
        );
    }
  }
}
