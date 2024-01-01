import 'package:fait/source/theme/custom_button_style.dart';
import 'package:fait/source/theme/custom_text_style.dart';
import 'package:fait/source/views/chat_bot/widgets/gender_widget.dart';
import 'package:fait/source/views/chat_bot/widgets/select_gender_widget.dart';
import 'package:fait/source/views/chat_bot/widgets/select_your_bd_widget.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../utils/size_utils.dart';
import '../../../theme/theme_helper.dart';
import '../widgets/build_send_message_widget.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithBirthDate extends StatefulWidget {
  const ChatBotViewBodyWithBirthDate({super.key});

  @override
  State<ChatBotViewBodyWithBirthDate> createState() =>
      _ChatBotViewBodyWithBirthDateState();
}

class _ChatBotViewBodyWithBirthDateState
    extends State<ChatBotViewBodyWithBirthDate> {
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
                    message: 'Please detect your birthday Ibrahim',
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  const SelectYourBirthDayWidget(),
                  SizedBox(
                    height: 10.v,
                  ),
                  Text('My Birthday is:',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontSize: 32.fSize)),
                  const ChatMessageWidget(
                    message: 'My BirthDay is dd/mm/yyyy',
                    isReceiver: true,
                  ),
                  const ChatMessageWidget(
                    message: "Great! Let's Continue",
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
                          Navigator.pushReplacementNamed(
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
