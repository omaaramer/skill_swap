import 'package:flutter/material.dart';
import 'package:skill_swap/core/routing/routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routes.onBoardingScrreen:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case routes.loginScreen:
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
