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

class ChatBotViewBodyWithFitnessLevel extends ConsumerStatefulWidget {
  const ChatBotViewBodyWithFitnessLevel({super.key});

  @override
  ConsumerState<ChatBotViewBodyWithFitnessLevel> createState() =>
      _ChatBotViewBodyWithFitnessLevelState();
}

class _ChatBotViewBodyWithFitnessLevelState
    extends ConsumerState<ChatBotViewBodyWithFitnessLevel> {
  String selectedLevel = '';

  void selectLevel(String level) {
    setState(() {
      selectedLevel = level;
    });
  }

  double _powerValue = 1;
  double _fitnessValue = 1;
  bool isPowerChanged = false;
  bool isFitnessChanged = false;

  final List<String> _powerLevel = [
    'Very Low',
    'Low',
    'Medium',
    'High',
    'Very High'
  ];
  final List<String> _fitnessLevel = [
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert',
    'Professional'
  ];
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
          decoration: BoxDecoration(
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
                      message: 'Choose your Power Level',
                    ),
                  ),
                  SizedBox(height: 10.v),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 3000,
                    child: Slider(
                      value: _powerValue,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          _powerValue = value;
                          isPowerChanged = true;
                        });
                      },
                      label: _powerLevel[(_powerValue.toInt() - 1)],
                    ),
                  ),
                  const SizedBox(height: 20),
                  isPowerChanged
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 1000,
                          child: ChatMessageWidget(
                            message:
                                "Your Power Level is ${_powerLevel[_powerValue.toInt() - 1]}",
                          ),
                        )
                      : const SizedBox(),
                  isPowerChanged
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 2000,
                          child: const ChatMessageWidget(
                            message: 'Choose your Fitness Level',
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(height: 10.v),
                  isPowerChanged
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 3000,
                          child: Slider(
                            value: _fitnessValue,
                            min: 1,
                            max: 5,
                            divisions: 4,
                            inactiveColor: Colors.grey,
                            onChanged: (value) {
                              setState(() {
                                _fitnessValue = value;
                                isFitnessChanged = true;
                              });
                            },
                            label: _fitnessLevel[(_fitnessValue.toInt() - 1)],
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  isFitnessChanged
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 1000,
                          child: ChatMessageWidget(
                            message:
                                "Your Fitness Level is ${_fitnessLevel[_fitnessValue.toInt() - 1]}",
                          ),
                        )
                      : const SizedBox(),
                  isFitnessChanged
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 2000,
                          child: const ChatMessageWidget(
                              message: "Nice Choice! Let's move on"),
                        )
                      : const SizedBox(),
                  isFitnessChanged ? const Spacer() : const SizedBox(),
                  if (isFitnessChanged && isPowerChanged)
                    CustomFutureAnimatedOpacityWidget(
                        waitingDurationInMilliSeconds: 3000,
                        child: const ChatBotButtonWidget(
                            route: AppRoutes.chatBotInjures)),
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
