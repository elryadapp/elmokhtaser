
import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/features/welcome_module/on_boarding_screen.dart';
import 'package:elmokhtaser/features/welcome_module/splash_screen.dart';
import 'package:flutter/material.dart';

class RouterGenarator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    switch (settings.name) 
    {

    case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => Scaffold(body: Container()));
  }
}
