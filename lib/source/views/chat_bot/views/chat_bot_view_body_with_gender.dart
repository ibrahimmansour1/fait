import 'package:fait/source/theme/custom_button_style.dart';
import 'package:fait/source/theme/custom_text_style.dart';
import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_name.dart';
import 'package:fait/source/views/chat_bot/widgets/gender_widget.dart';
import 'package:fait/source/views/chat_bot/widgets/select_gender_widget.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../utils/size_utils.dart';
import '../../../theme/theme_helper.dart';
import '../widgets/build_send_message_widget.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

bool isMale = false;
bool isFemale = false;
var messageController = TextEditingController();
Future<void> showMessages() async {
  await Future.delayed(const Duration(seconds: 1))
      .then((value) => const ChatMessageWidget(message: 'message'));
  // Show first message

  await Future.delayed(const Duration(seconds: 1));
  // Show second message
  const ChatMessageWidget(
    message: 'message',
    isReceiver: true,
  );

  await Future.delayed(const Duration(seconds: 1));
  // Show third message
  ChatMessageWidget(
    message: messageController.text,
    isReceiver: false,
  );
}

class ChatBotViewBodyWithGender extends StatefulWidget {
  const ChatBotViewBodyWithGender({super.key});

  @override
  State<ChatBotViewBodyWithGender> createState() =>
      _ChatBotViewBodyWithGenderState();
}

class _ChatBotViewBodyWithGenderState extends State<ChatBotViewBodyWithGender> {
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
                  ChatMessageWidget(message: 'Then $name'),
                  const ChatMessageWidget(
                    message: 'Choose your gender',
                    isReceiver: true,
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  const SelectGenderWidget(),
                  SizedBox(
                    height: 10.v,
                  ),
                  Text('My Gender:',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontSize: 32.fSize)),
                  ChatMessageWidget(
                    message: isMale
                        ? 'My Gender is Male'
                        : 'My Gender is Female',
                    isReceiver: true,
                  ),
                  const ChatMessageWidget(
                    message: "Awesome! Let's continue",
                  ),
                  const Spacer(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0.h, vertical: 8.v),
                    child: CustomElevatedButton(
                        height: 58.v,
                        text: "Continue",
                        rightIcon: Row(
                          children: [
                            SizedBox(
                              width: 80.v,
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        buttonTextStyle: CustomTextStyles.titleLargeInter,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/chat_bot_view_body_with_birth_date');
                        }),
                  ),
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
