import 'package:flutter/material.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/features/onBoarding/ui/onboarding_pageView.dart';
import 'package:skill_swap/features/welcome_screen/welcome_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScrreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingPageView());
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
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
