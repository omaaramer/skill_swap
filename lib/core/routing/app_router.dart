import 'package:flutter/material.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/features/onBoarding/ui/onboarding_pageView.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScrreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingPageView());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const Placeholder());
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
