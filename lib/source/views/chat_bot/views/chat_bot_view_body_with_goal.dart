import 'package:fait/source/routes.dart';
import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/app_export.dart';
import '../../../providers/theme/theme_provider.dart';
import '../../../widgets/custom_future_animated_opacity_widget.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithGoal extends ConsumerStatefulWidget {
  const ChatBotViewBodyWithGoal({super.key});

  @override
  ConsumerState<ChatBotViewBodyWithGoal> createState() =>
      _ChatBotViewBodyWithGoalState();
}

class _ChatBotViewBodyWithGoalState
    extends ConsumerState<ChatBotViewBodyWithGoal> {
  String selectedGoal = '';
  bool isGoalSelected = false;

  void selectGoal(String goal) {
    setState(() {
      selectedGoal = goal;
      isGoalSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.watch(themeNotifierProvider);
    final themeData = themeHelper.getThemeData();
    mediaQueryData = MediaQuery.of(context);

    Widget buildGoalOption(String goal, IconData icon) {
      bool isSelected = selectedGoal == goal;
      Color borderColor =
          isSelected ? themeData.colorScheme.primary : Colors.transparent;
      Color iconBackgroundColor =
          isSelected ? themeData.colorScheme.primary : const Color(0xFF4C5A81);
      Color iconColor =
          isSelected ? Colors.white : Colors.white.withOpacity(0.5);
      Color textColor = isSelected
          ? themeData.colorScheme.primary
          : themeHelper.getThemeData().colorScheme.tertiary;

      return GestureDetector(
        onTap: () => selectGoal(goal),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 37),
          decoration: ShapeDecoration(
            color: themeData.colorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: borderColor),
              borderRadius: BorderRadius.circular(16.adaptSize),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 62.h,
                height: 62.v,
                decoration: ShapeDecoration(
                  color: iconBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(height: 18),
              Text(
                goal,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: BoxDecoration(
          color: themeData.colorScheme.background,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomChatBotAppBar(),
              CustomFutureAnimatedOpacityWidget(
                waitingDurationInMilliSeconds: 1000,
                child: const ChatMessageWidget(message: 'Awesome'),
              ),
              CustomFutureAnimatedOpacityWidget(
                waitingDurationInMilliSeconds: 2000,
                child: const ChatMessageWidget(
                  message: 'Choose your goal',
                ),
              ),
              SizedBox(height: 10.v),
              CustomFutureAnimatedOpacityWidget(
                waitingDurationInMilliSeconds: 3000,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20.h),
                      buildGoalOption('Weight Loss', Icons.directions_run),
                      const SizedBox(width: 20),
                      buildGoalOption('Muscle Gain', Icons.fitness_center),
                      const SizedBox(width: 20),
                      buildGoalOption(
                          'Healthy Lifestyle', Icons.accessibility_new),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (isGoalSelected) ...[
                CustomFutureAnimatedOpacityWidget(
                  waitingDurationInMilliSeconds: 1000,
                  child: Text(
                    '  My Goal:',
                    style: themeData.textTheme.bodyLarge!.copyWith(
                      fontSize: 32.fSize,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                CustomFutureAnimatedOpacityWidget(
                  waitingDurationInMilliSeconds: 2000,
                  child: ChatMessageWidget(
                    message: "Your goal is $selectedGoal",
                  ),
                ),
                CustomFutureAnimatedOpacityWidget(
                  waitingDurationInMilliSeconds: 3000,
                  child: const ChatMessageWidget(
                      message: "Nice Choice! Let's move on"),
                ),
                const Spacer(),
                CustomFutureAnimatedOpacityWidget(
                  waitingDurationInMilliSeconds: 4000,
                  child: const ChatBotButtonWidget(
                      route: AppRoutes.chatBotFitnessLevel),
                ),
              ],
              SizedBox(height: 20.v),
            ],
          ),
        ),
      ),
    );
  }
}
