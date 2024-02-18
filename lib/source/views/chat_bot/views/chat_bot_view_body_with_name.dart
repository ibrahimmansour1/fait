import 'package:fait/source/theme/custom_button_style.dart';
import 'package:fait/source/theme/custom_text_style.dart';
import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/size_utils.dart';
import '../../../theme/theme_helper.dart';
import '../widgets/build_send_message_widget.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();
String name = "";

class ChatBotViewBodyName extends StatefulWidget {
  const ChatBotViewBodyName({super.key});

  @override
  State<ChatBotViewBodyName> createState() => _ChatBotViewBodyNameState();
}

class _ChatBotViewBodyNameState extends State<ChatBotViewBodyName> {
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
                  const ChatMessageWidget(message: "Hello"),
                  const ChatMessageWidget(message: "I'm FAIT your AI Trainer"),
                  const ChatMessageWidget(
                      message: "May I know your nick name?"),
                  SizedBox(height: 20.v),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text('My Name:',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontSize: 32.fSize)),
                  ),
                  SizedBox(height: 10.v),
                  ChatMessageWidget(
                    message: name,
                    isReceiver: true,
                  ),
                  const ChatMessageWidget(
                      message: "Nice Name! Glad to know you"),
                  const ChatMessageWidget(message: "Press Continue to go on"),
                  const Spacer(),
                  const ChatBotButtonWidget(
                      route: '/chat_bot_view_body_with_gender'),
                  SizedBox(
                    height: 10.v,
                  ),
                  BuildSendMessageWidget(
                    onTap: () {
                      setState(() {
                        name = messageController.text;
                      });
                    },
                    messageController: messageController,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
