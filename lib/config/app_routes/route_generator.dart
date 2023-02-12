import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/features/auth_module/presentation/login/login_screen.dart';
import 'package:elmokhtaser/features/auth_module/presentation/register/register_screen.dart';
import 'package:elmokhtaser/features/auth_module/presentation/validations/verification_screen.dart';
import 'package:elmokhtaser/features/layout_module/presentation/main_layout/layout_screen.dart';
import 'package:elmokhtaser/features/welcome_module/on_boarding_screen.dart';
import 'package:elmokhtaser/features/welcome_module/splash_screen.dart';
import 'package:flutter/material.dart';

class RouterGenarator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.verification:
        return MaterialPageRoute(
            builder: (context) => const VerificationScreen());
      case Routes.layout:
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => Scaffold(body: Container()));
  }
}
