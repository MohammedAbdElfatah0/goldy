import 'package:flutter/material.dart';
import 'package:goldy/core/routing/routes.dart';

import '../../features/gold/presentation/screens/gold_screen.dart';
import '../presentation/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case AppRoutes.gold:
        return MaterialPageRoute(builder: (_)=>const GoldScreen());
        case AppRoutes.silver:
        // return MaterialPageRoute(builder: (_)=>const SilverScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
