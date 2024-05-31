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
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration:  BoxDecoration(
            color: themeHelper.getThemeData().colorScheme.background,
          ),
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomChatBotAppBar(),
                  CustomFutureAnimatedOpacityWidget(
                      waitingDurationInMilliSeconds: 1000,
                      child: const ChatMessageWidget(message: 'Awesome')),
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
                          GestureDetector(
                            onTap: () {
                              selectGoal('Weight Loss');
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 18,
                                left: 37,
                                right: 36,
                                bottom: 20,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF353767),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 3,
                                    color: selectedGoal == "Weight Loss"
                                        ? themeHelper.themeColor().blueGray80004
                                        : themeHelper
                                            .getThemeData()
                                            .colorScheme
                                            .primary,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(16.adaptSize),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 62.h,
                                    height: 62.v,
                                    decoration: ShapeDecoration(
                                      color: selectedGoal == "Weight Loss"
                                          ? themeHelper
                                              .themeColor()
                                              .blueGray80004
                                          : themeHelper
                                              .getThemeData()
                                              .colorScheme
                                              .primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.directions_run,
                                      color: selectedGoal == "Weight Loss"
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.5),
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    "Weight Loss",
                                    style: TextStyle(
                                      color: selectedGoal == "Weight Loss"
                                          ? themeHelper
                                              .themeColor()
                                              .blueGray80004
                                          : themeHelper
                                              .getThemeData()
                                              .colorScheme
                                              .primary,
                                      fontSize: 16.fSize,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              selectGoal('Muscle Gain');
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 18,
                                left: 37,
                                right: 36,
                                bottom: 20,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF353767),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 3,
                                    color: selectedGoal == "Muscle Gain"
                                        ? themeHelper.themeColor().blueGray80004
                                        : themeHelper
                                            .getThemeData()
                                            .colorScheme
                                            .primary,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(16.adaptSize),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 62.h,
                                    height: 62.v,
                                    decoration: ShapeDecoration(
                                      color: selectedGoal == "Muscle Gain"
                                          ? themeHelper
                                              .themeColor()
                                              .blueGray80004
                                          : themeHelper
                                              .getThemeData()
                                              .colorScheme
                                              .primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.fitness_center,
                                      color: selectedGoal == "Muscle Gain"
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.5),
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    "Muscle Gain",
                                    style: TextStyle(
                                      color: selectedGoal == "Muscle Gain"
                                          ? themeHelper
                                              .themeColor()
                                              .blueGray80004
                                          : themeHelper
                                              .getThemeData()
                                              .colorScheme
                                              .primary,
                                      fontSize: 16.fSize,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              selectGoal('Health Life Style');
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 18,
                                left: 37,
                                right: 36,
                                bottom: 20,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF353767),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 3,
                                    color: selectedGoal == "Health Life Style"
                                        ? themeHelper.themeColor().blueGray80004
                                        : themeHelper
                                            .getThemeData()
                                            .colorScheme
                                            .primary,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(16.adaptSize),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 62.h,
                                    height: 62.v,
                                    decoration: ShapeDecoration(
                                      color: selectedGoal == "Health Life Style"
                                          ? themeHelper
                                              .themeColor()
                                              .blueGray80004
                                          : themeHelper
                                              .getThemeData()
                                              .colorScheme
                                              .primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.accessibility_new,
                                      color: selectedGoal == "Health Life Style"
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.5),
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    "Health Life Style",
                                    style: TextStyle(
                                      color: selectedGoal == "Health Life Style"
                                          ? themeHelper
                                              .themeColor()
                                              .blueGray80004
                                          : themeHelper
                                              .getThemeData()
                                              .colorScheme
                                              .primary,
                                      fontSize: 16.fSize,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  isGoalSelected
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 1000,
                          child: Text('  My Goal:',
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontSize: 32.fSize)),
                        )
                      : const SizedBox(),
                  isGoalSelected
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 2000,
                          child: ChatMessageWidget(
                            message: "Your Goal is $selectedGoal",
                          ),
                        )
                      : const SizedBox(),
                  isGoalSelected
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 3000,
                          child: const ChatMessageWidget(
                              message: "Nice Choice! Let's move on"),
                        )
                      : const SizedBox(),
                  isGoalSelected ? const Spacer() : const SizedBox(),
                  isGoalSelected
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 4000,
                          child: const ChatBotButtonWidget(
                              route: AppRoutes.chatBotFitnessLevel))
                      : const SizedBox(),
                  SizedBox(
                    height: 20.v,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
