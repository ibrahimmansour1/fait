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

class ChatBotViewBodyWithWorkoutDays extends ConsumerStatefulWidget {
  const ChatBotViewBodyWithWorkoutDays({super.key});

  @override
  ConsumerState<ChatBotViewBodyWithWorkoutDays> createState() =>
      _ChatBotViewBodyWithWorkoutDaysState();
}

class _ChatBotViewBodyWithWorkoutDaysState
    extends ConsumerState<ChatBotViewBodyWithWorkoutDays> {
  List<String> selectedDays = [];

  final List<String> daysOfTheWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  bool isDaysSelected = false;
  void toggleDays(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
    isDaysSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.watch(themeNotifierProvider);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            color: themeHelper.getThemeData().colorScheme.background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomChatBotAppBar(),
                // const ChatMessageWidget(message: 'then $name'),
                CustomFutureAnimatedOpacityWidget(
                  waitingDurationInMilliSeconds: 1000,
                  child: const ChatMessageWidget(
                    message: 'Which days do you workout?',
                  ),
                ),
                SizedBox(height: 10.v),
                CustomFutureAnimatedOpacityWidget(
                  waitingDurationInMilliSeconds: 2000,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '  🗓️  Days',
                        style: CustomTextStyles.titleLargeInter!.copyWith(
                            fontSize: 32.fSize,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                      ),
                      SizedBox(height: 10.v),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: daysOfTheWeek.map((day) {
                            final isSelected = selectedDays.contains(day);
                            return ChoiceChip(
                              label: Text(
                                day,
                                style: isSelected
                                    ? CustomTextStyles.titleLargeInter
                                        .copyWith(color: Colors.white)
                                    : CustomTextStyles.titleLargeInter
                                        .copyWith(color: Colors.white),
                              ),
                              selected: isSelected,
                              selectedColor: const Color(0xFF8394CA),
                              backgroundColor: const Color(0xFF353767),
                              onSelected: (_) {
                                toggleDays(day);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.v),
                isDaysSelected
                    ? CustomFutureAnimatedOpacityWidget(
                        waitingDurationInMilliSeconds: 1000,
                        child: const ChatMessageWidget(
                            message: "Ok! Let's continue"))
                    : const SizedBox(),
                const Spacer(),

                isDaysSelected
                    ? CustomFutureAnimatedOpacityWidget(
                        waitingDurationInMilliSeconds: 2000,
                        child: const ChatBotButtonWidget(
                            route: AppRoutes.chatBotWorkoutToolsDetection),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 20.v,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
