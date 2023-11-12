import 'package:fait/source/views/home/views/home_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (context) => const Splash());
      // case 'onboarding':
      //   return MaterialPageRoute(builder: (context) => const OnBoarding());
      // case 'login':
      //   return MaterialPageRoute(builder: (context) => const LoginScreen());
      // case 'signup':
      //   return MaterialPageRoute(builder: (context) => const SignupScreen());
      case 'home':
        return MaterialPageRoute(builder: (context) => const HomeView());
      // case 'forgot':
      //   return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
      // case 'reset':
      //   return MaterialPageRoute(builder: (context) => ResetPasswordScreen());
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
