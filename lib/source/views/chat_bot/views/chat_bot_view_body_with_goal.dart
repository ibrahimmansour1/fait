import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_export.dart';
import '../../../../utils/size_utils.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithGoal extends StatefulWidget {
  const ChatBotViewBodyWithGoal({super.key});

  @override
  State<ChatBotViewBodyWithGoal> createState() =>
      _ChatBotViewBodyWithGoalState();
}

class _ChatBotViewBodyWithGoalState extends State<ChatBotViewBodyWithGoal> {
  String selectedGoal = '';

  void selectGoal(String goal) {
    setState(() {
      selectedGoal = goal;
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: const BoxDecoration(color: Color(0xFF282B4C)),
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomChatBotAppBar(),
                  const ChatMessageWidget(message: 'Awesome'),
                  const ChatMessageWidget(
                    message: 'Choose your goal',
                  ),
                  SizedBox(height: 10.v),
                  SingleChildScrollView(
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
                                      ? const Color(0xFF17D1E0)
                                      : const Color(0xFF4C5A81),
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
                                        ? const Color(0xFF17D1E0)
                                        : const Color(0xFF4C5A81),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
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
                                        ? const Color(0xFF17D1E0)
                                        : const Color(0xFF4C5A81),
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
                                      ? const Color(0xFF17D1E0)
                                      : const Color(0xFF4C5A81),
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
                                        ? const Color(0xFF17D1E0)
                                        : const Color(0xFF4C5A81),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
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
                                        ? const Color(0xFF17D1E0)
                                        : const Color(0xFF4C5A81),
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
                                      ? const Color(0xFF17D1E0)
                                      : const Color(0xFF4C5A81),
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
                                        ? const Color(0xFF17D1E0)
                                        : const Color(0xFF4C5A81),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
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
                                        ? const Color(0xFF17D1E0)
                                        : const Color(0xFF4C5A81),
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
                  const SizedBox(height: 20),
                  Text('  My Goal:',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontSize: 32.fSize)),
                  ChatMessageWidget(
                    message: "Your Goal is $selectedGoal",
                  ),
                  const ChatMessageWidget(
                      message: "Nice Choice! Let's move on"),
                  const Spacer(),
                  const ChatBotButtonWidget(route: '/chat_bot_fitness_level'),
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
