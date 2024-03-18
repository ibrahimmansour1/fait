import 'package:fait/source/views/chat_bot/views/chat_bot_view.dart';

import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_allergy.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_diseases.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_injures.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_fitness_level.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_gender.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_birth_date.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_goal.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_name.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_tools_detection.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_workout_days.dart';

import 'package:fait/source/views/fitness/views/open_camera_screen/open_camera_screen.dart';
import 'package:fait/source/views/fitness/views/overview_screen/overview_screen.dart';

import 'package:fait/source/views/home/views/home_view.dart';
import 'package:fait/source/views/onboarding/views/on_boarding_view.dart';
import 'package:fait/source/views/register/views/log_in_screen.dart';
import 'package:fait/source/views/register/views/sign_up_methods_screen.dart';
import 'package:fait/source/views/register/views/sign_up_screen.dart';
import 'package:fait/source/views/statistics_screens/views/after_login_screen.dart';
import 'package:fait/source/views/statistics_screens/views/daily_intake_screen.dart';
import 'package:fait/source/views/statistics_screens/views/sleep_tracker_screen.dart';
import 'package:fait/source/views/statistics_screens/views/steps_tracker_screen.dart';
import 'package:fait/source/views/statistics_screens/views/water_intake_screen.dart';
import 'package:flutter/material.dart';
import 'views/chat_bot/views/chat_bot_view_body_with_height_and_weight.dart';
import 'views/diet/views/diet_plans_screen.dart';
import 'views/diet/views/diet_screen.dart';
import 'views/fitness/views/fitness_screen.dart';

import 'views/fitness/views/my_activity_screen.dart';
import 'views/fitness/views/workout_tap_bar_screens/workout_overview_screen.dart';

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
      case '/chat_bot_goal_screen':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithGoal());
      case '/chat_bot_injures':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithInjures());
      case '/chat_bot_diseases':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithDiseases());
      case '/chat_bot_allergy':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithAllergy());
      case '/chat_bot_fitness_level':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithFitnessLevel());
      case '/chat_bot_workout_days':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithWorkoutDays());
      case '/chat_bot_workout_tools_detection':
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithToolsDetection());
      case '/fitness_screen':
        return MaterialPageRoute(builder: (context) => FitnessScreen());

      case '/diet_screen':
        return MaterialPageRoute(builder: (context) => DietScreen());

      case '/diet_plans_screen':
        return MaterialPageRoute(builder: (context) => DietPlansScreen());

      case '/daily_intake_screen':
        return MaterialPageRoute(
            builder: (context) => const DailyIntakeScreen());
      case '/water_intake_screen':
        return MaterialPageRoute(builder: (context) => WaterIntakeScreen());
      case '/sleep_tracker_screen':
        return MaterialPageRoute(
            builder: (context) => const SleepTrackerScreen());
      case '/after_login_screen':
        return MaterialPageRoute(
            builder: (context) => const AfterLoginScreen());
      case '/steps_tracker_screen':
        return MaterialPageRoute(
            builder: (context) => const StepsTrackerScreen());
      case '/workout_group_screen':
        return MaterialPageRoute(
            builder: (context) => const WorkoutOverviewScreen());
      case '/my_activity_screen':
        return MaterialPageRoute(
            builder: (context) => const MyActivityScreen(),
            fullscreenDialog: true);

      // case 'verification':
      //   return MaterialPageRoute(
      //       builder: (context) => const VerificationScreen());
      // case 'menu':
      //   return MaterialPageRoute(builder: (context) => const MenuScreen());

      case '/overview_screen':
        return MaterialPageRoute(builder: (context) => const OverviewScreen());

      case '/open_camera_screen':
        return MaterialPageRoute(
            builder: (context) => const OpenCameraScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const Center(
            child: Text("Undefined Route"),
          ),
        );
    }
  }
}
