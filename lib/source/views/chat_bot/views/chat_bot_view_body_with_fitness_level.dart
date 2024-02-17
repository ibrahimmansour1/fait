import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import '../../../../utils/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithFitnessLevel extends StatefulWidget {
  const ChatBotViewBodyWithFitnessLevel({super.key});

  @override
  State<ChatBotViewBodyWithFitnessLevel> createState() =>
      _ChatBotViewBodyWithFitnessLevelState();
}

class _ChatBotViewBodyWithFitnessLevelState
    extends State<ChatBotViewBodyWithFitnessLevel> {
  String selectedLevel = '';

  void selectLevel(String level) {
    setState(() {
      selectedLevel = level;
    });
  }

  double _powerValue = 1;
  double _fitnessValue = 1;

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
                    message: 'Choose your Power Level',
                  ),
                  SizedBox(height: 10.v),
                  Slider(
                    value: _powerValue,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    onChanged: (value) {
                      setState(() {
                        _powerValue = value;
                      });
                    },
                    label: _powerLevel[(_powerValue.toInt() - 1)],
                  ),
                  const SizedBox(height: 20),
                  ChatMessageWidget(
                    message:
                        "Your Fitness Level is ${_powerLevel[_powerValue.toInt() - 1]}",
                  ),
                  const ChatMessageWidget(
                    message: 'Choose your Fitness Level',
                  ),
                  SizedBox(height: 10.v),
                  Slider(
                    value: _fitnessValue,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    onChanged: (value) {
                      setState(() {
                        _fitnessValue = value;
                      });
                    },
                    label: _fitnessLevel[(_fitnessValue.toInt() - 1)],
                  ),
                  const SizedBox(height: 20),
                  ChatMessageWidget(
                    message:
                        "Your Fitness Level is ${_fitnessLevel[_fitnessValue.toInt() - 1]}",
                  ),
                  const ChatMessageWidget(
                      message: "Nice Choice! Let's move on"),
                  const Spacer(),
                  const ChatBotButtonWidget(route: '/chat_bot_injures'),
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
