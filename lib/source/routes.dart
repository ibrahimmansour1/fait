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
import 'package:fait/source/views/diet/views/diet_info_screen.dart';

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
import 'views/fitness/views/fitness_screen.dart';

import 'views/fitness/views/my_activity_screen.dart';
import 'views/fitness/views/workout_tap_bar_screens/workout_overview_screen.dart';
import 'views/loading_screen.dart';
import 'views/fitness/views/wrong_exercises_steps_screen/wrong_exercises_step_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = 'onboarding';
  static const String mainOnboardingScreen = '/main_onboarding_screen';
  static const String login = '/login';
  static const String signUp = 'signup';
  static const String home = '/home';
  static const String onBoardingScreen = '/on_boarding_screen';
  static const String onBoardingSignUpScreen = '/on_boarding_sign_up_screen';
  static const String chatBotView = '/chat_bot_view';
  static const String chatBotViewBodyWithGender =
      '/chat_bot_view_body_with_gender';
  static const String chatBotViewBodyWithName = '/chat_bot_view_body_with_name';
  static const String chatBotViewBodyWithBirthDate =
      '/chat_bot_view_body_with_birth_date';
  static const String chatBotViewBodyWithHeightAndWeight =
      '/chat_bot_view_body_with_height_and_weight';
  static const String chatBotGoalScreen = '/chat_bot_goal_screen';
  static const String chatBotInjures = '/chat_bot_injures';
  static const String chatBotDiseases = '/chat_bot_diseases';
  static const String chatBotAllergy = '/chat_bot_allergy';
  static const String chatBotFitnessLevel = '/chat_bot_fitness_level';
  static const String chatBotWorkoutDays = '/chat_bot_workout_days';
  static const String chatBotWorkoutToolsDetection =
      '/chat_bot_workout_tools_detection';
  static const String fitnessScreen = '/fitness_screen';
  static const String dailyIntakeScreen = '/daily_intake_screen';
  static const String waterIntakeScreen = '/water_intake_screen';
  static const String sleepTrackerScreen = '/sleep_tracker_screen';
  static const String afterLoginScreen = '/after_login_screen';
  static const String stepsTrackerScreen = '/steps_tracker_screen';
  static const String workoutGroupScreen = '/workout_group_screen';
  static const String myActivityScreen = '/my_activity_screen';
  static const String verification = 'verification';
  static const String menu = 'menu';
  static const String overviewScreen = '/overview_screen';
  static const String openCameraScreen = '/open_camera_screen';
  static const String loadingScreen = '/loading_screen';
  static const String wrongExercisesStepsScreen =
      '/wrong_exercises_steps_screen';

  static const String dietInfoScreen =
      '/diet_info_screen';

}

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.splash:
      //   return MaterialPageRoute(builder: (context) => const Splash());
      // case AppRoutes.onboarding:
      //   return MaterialPageRoute(builder: (context) => const OnBoarding());
      case AppRoutes.mainOnboardingScreen:
        return MaterialPageRoute(
            builder: (context) => const MainOnboardingScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => LogInScreen());
      // case AppRoutes.signup:
      //   return MaterialPageRoute(builder: (context) => const SignupScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const SignUpMethodsScreen());
      case AppRoutes.onBoardingSignUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case AppRoutes.chatBotView:
        return MaterialPageRoute(builder: (context) => const ChatBotView());

      case AppRoutes.chatBotViewBodyWithGender:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithGender());
      case AppRoutes.chatBotViewBodyWithName:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyName());
      case AppRoutes.chatBotViewBodyWithBirthDate:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithBirthDate());
      case AppRoutes.chatBotViewBodyWithHeightAndWeight:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithHeightAndWeight());
      case AppRoutes.chatBotGoalScreen:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithGoal());
      case AppRoutes.chatBotInjures:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithInjures());
      case AppRoutes.chatBotDiseases:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithDiseases());
      case AppRoutes.chatBotAllergy:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithAllergy());
      case AppRoutes.chatBotFitnessLevel:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithFitnessLevel());
      case AppRoutes.chatBotWorkoutDays:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithWorkoutDays());
      case AppRoutes.chatBotWorkoutToolsDetection:
        return MaterialPageRoute(
            builder: (context) => const ChatBotViewBodyWithToolsDetection());
      case AppRoutes.fitnessScreen:
        return MaterialPageRoute(builder: (context) => FitnessScreen());

      case AppRoutes.dailyIntakeScreen:
        return MaterialPageRoute(
            builder: (context) => const DailyIntakeScreen());
      case AppRoutes.waterIntakeScreen:
        return MaterialPageRoute(builder: (context) => WaterIntakeScreen());
      case AppRoutes.sleepTrackerScreen:
        return MaterialPageRoute(
            builder: (context) => const SleepTrackerScreen());
      case AppRoutes.afterLoginScreen:
        return MaterialPageRoute(
            builder: (context) => const AfterLoginScreen());
      case AppRoutes.stepsTrackerScreen:
        return MaterialPageRoute(
            builder: (context) => const StepsTrackerScreen());
      case AppRoutes.workoutGroupScreen:
        return MaterialPageRoute(
            builder: (context) => const WorkoutOverviewScreen());
      case AppRoutes.myActivityScreen:
        return MaterialPageRoute(
            builder: (context) => const MyActivityScreen(),
            fullscreenDialog: true);

      // case AppRoutes.verification:
      //   return MaterialPageRoute(
      //       builder: (context) => const VerificationScreen());
      // case AppRoutes.menu:
      //   return MaterialPageRoute(builder: (context) => const MenuScreen());

      case AppRoutes.overviewScreen:
        return MaterialPageRoute(builder: (context) => const OverviewScreen());

      case AppRoutes.openCameraScreen:
        return MaterialPageRoute(
            builder: (context) => const OpenCameraScreen());
      case AppRoutes.loadingScreen:
        return MaterialPageRoute(
            builder: (context) => const LoadingScreen(),
            fullscreenDialog: true);

      default:
      case AppRoutes.wrongExercisesStepsScreen:
        return MaterialPageRoute(
            builder: (context) => const WrongExercisesStepScreen());
      case AppRoutes.dietInfoScreen:
        return MaterialPageRoute(
            builder: (context) => const DietInfoScreen());

      // default:
      //   return MaterialPageRoute(
      //     builder: (context) => const Center(
      //       child: Text("Undefined Route"),
      //     ),
      //   );
    }
    return null;
  }
}
