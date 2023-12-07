import 'package:fait/source/views/home/views/home_view.dart';
import 'package:fait/source/views/onboarding/views/on_boarding_view.dart';
import 'package:fait/source/views/register/views/log_in_screen.dart';
import 'package:fait/source/views/register/views/on_boarding_screen.dart';
import 'package:fait/source/views/register/views/on_boarding_sign_up_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (context) => const Splash());
      // case 'onboarding':
      //   return MaterialPageRoute(builder: (context) => const OnBoarding());
      case '/main_onboarding_screen':
        return MaterialPageRoute(
            builder: (context) => const MainOnboardingScreen());
      case '/login':
        return MaterialPageRoute(builder: (context) => LogInScreen());
      // case 'signup':
      //   return MaterialPageRoute(builder: (context) => const SignupScreen());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeView());
      case '/on_boarding_screen':
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case '/on_boarding_sign_up_screen':
        return MaterialPageRoute(
            builder: (context) => const OnBoardingSignUpScreen());
      // case 'verification':
      //   return MaterialPageRoute(
      //       builder: (context) => const VerificationScreen());
      // case 'menu':
      //   return MaterialPageRoute(builder: (context) => const MenuScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const SizedBox(
            child: Text("Error"),
          ),
        );
    }
  }
}
