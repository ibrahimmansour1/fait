import 'package:fait/source/theme/custom_button_style.dart';
import 'package:fait/source/theme/custom_text_style.dart';
import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:fait/source/views/chat_bot/widgets/select_your_bd_widget.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/size_utils.dart';
import '../widgets/build_send_message_widget.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';
import '../widgets/select_your_height_widget.dart';
import '../widgets/select_your_weight_widget.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithHeightAndWeight extends StatefulWidget {
  const ChatBotViewBodyWithHeightAndWeight({super.key});

  @override
  State<ChatBotViewBodyWithHeightAndWeight> createState() =>
      _ChatBotViewBodyWithHeightAndWeightState();
}

class _ChatBotViewBodyWithHeightAndWeightState
    extends State<ChatBotViewBodyWithHeightAndWeight> {
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
                  const ChatMessageWidget(
                    message: 'Please detect your Height Ibrahim',
                  ),
                  SizedBox(height: 10.v),
                  const SelectYourHeightWidget(),
                  const ChatMessageWidget(
                    message: "Great! Let's detect your weight",
                  ),
                  SizedBox(height: 10.v),
                  const SelectYourWeightWidget(),
                  const Spacer(),
                  const ChatBotButtonWidget(route: '/chat_bot_goal_screen'),
                  SizedBox(
                    height: 10.v,
                  ),
                  BuildSendMessageWidget(
                    messageController: messageController,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
