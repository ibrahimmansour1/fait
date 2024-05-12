import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_future_animated_opacity_widget.dart';
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

bool isNameSubmitted = false;

class _ChatBotViewBodyNameState extends State<ChatBotViewBodyName> {
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: const BoxDecoration(color: Color(0xFF282B4C)),
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomChatBotAppBar(),
                  CustomFutureAnimatedOpacityWidget(
                    child: const ChatMessageWidget(message: "Hello"),
                  ),
                  CustomFutureAnimatedOpacityWidget(
                      waitingDurationInMilliSeconds: 2000,
                      child: const ChatMessageWidget(
                          message: "I'm FAIT your AI Trainer")),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 3000,
                    child: const ChatMessageWidget(
                        message: "May I know your nick name?"),
                  ),
                  SizedBox(height: 20.v),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 4000,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text('My Name:',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(fontSize: 32.fSize)),
                    ),
                  ),
                  SizedBox(height: 10.v),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 5000,
                    child: ChatMessageWidget(
                      message: name,
                      isReceiver: true,
                    ),
                  ),
                  isNameSubmitted
                      ? Column(
                          children: [
                            CustomFutureAnimatedOpacityWidget(
                              waitingDurationInMilliSeconds: 1000,
                              child: const ChatMessageWidget(
                                  message: "Nice Name! Glad to know you"),
                            ),
                            CustomFutureAnimatedOpacityWidget(
                              waitingDurationInMilliSeconds: 2000,
                              child: const ChatMessageWidget(
                                  message: "Press Continue to go on"),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  isNameSubmitted ? const Spacer() : const SizedBox(),
                  isNameSubmitted
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 3000,
                          child: const ChatBotButtonWidget(
                              route: '/chat_bot_view_body_with_gender'),
                        )
                      : const SizedBox(),
                  isNameSubmitted
                      ? SizedBox(
                          height: 20.v,
                        )
                      : const SizedBox(),
                  !isNameSubmitted ? const Spacer() : const SizedBox(),
                  !isNameSubmitted
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 5000,
                          child: BuildSendMessageWidget(
                            // autoFocus: false,
                            // myFocusNode: myFocusNode,
                            onTap: () {
                              setState(() {
                                name = messageController.text;
                                isNameSubmitted = true;
                              });
                            },
                            messageController: messageController,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
