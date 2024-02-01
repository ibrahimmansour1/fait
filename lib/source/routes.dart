import 'package:fait/source/views/chat_bot/views/chat_bot_view.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_gender.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_birth_date.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_name.dart';
import 'package:fait/source/views/home/views/home_view.dart';
import 'package:fait/source/views/onboarding/views/on_boarding_view.dart';
import 'package:fait/source/views/register/views/log_in_screen.dart';
import 'package:fait/source/views/register/views/sign_up_methods_screen.dart';
import 'package:fait/source/views/register/views/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'views/chat_bot/views/chat_bot_view_body_with_height_and_weight.dart';

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
            builder: (context) => const SignUpMethodsScreen());
      case '/on_boarding_sign_up_screen':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      // case '/chat_bot':
      //   return MaterialPageRoute(builder: (context) => const ChatBotView());
      case '/chat_bot_view':
        return MaterialPageRoute(builder: (context) => const ChatBotView());
      case '/chat_bot_view_body_with_gender':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithGender());
      case '/chat_bot_view_body_with_name':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyName());
      case '/chat_bot_view_body_with_birth_date':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithBirthDate());
      case '/chat_bot_view_body_with_height_and_weight':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithHeightAndWeight());
      // case 'verification':
      //   return MaterialPageRoute(
      //       builder: (context) => const VerificationScreen());
      // case 'menu':
      //   return MaterialPageRoute(builder: (context) => const MenuScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const Center(
            child: Text("Undefined Route"),
          ),
        );
    }
  }
}
