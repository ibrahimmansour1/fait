import 'package:fait/source/views/chat_bot/views/chat_bot_view_body_with_name.dart';
import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:fait/source/views/chat_bot/widgets/select_gender_widget.dart';
import 'package:flutter/material.dart';
import '../../../../utils/size_utils.dart';
import '../../../widgets/custom_future_animated_opacity_widget.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithGender extends StatefulWidget {
  const ChatBotViewBodyWithGender({super.key});

  @override
  State<ChatBotViewBodyWithGender> createState() =>
      _ChatBotViewBodyWithGenderState();
}

class _ChatBotViewBodyWithGenderState extends State<ChatBotViewBodyWithGender> {
  String selectedGender = '';
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
                  CustomFutureAnimatedOpacityWidget(
                      waitingDurationInMilliSeconds: 1000,
                      child: ChatMessageWidget(message: 'Then $name')),
                  CustomFutureAnimatedOpacityWidget(
                      waitingDurationInMilliSeconds: 2000,
                      child: const ChatMessageWidget(
                          message: 'Choose your gender')),
                  SizedBox(
                    height: 10.v,
                  ),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 3000,
                    child: SelectGenderWidget(
                        selectedGender: selectedGender,
                        onGenderSelected: (gender) {
                          setState(() {
                            selectedGender = gender;
                          });
                        }),
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  selectedGender != ''
                      ? Expanded(
                          child: Column(
                            children: [
                              CustomFutureAnimatedOpacityWidget(
                                waitingDurationInMilliSeconds: 3000,
                                child: const ChatMessageWidget(
                                  message: "Awesome! Let's continue",
                                ),
                              ),
                              const Spacer(),
                              CustomFutureAnimatedOpacityWidget(
                                waitingDurationInMilliSeconds: 4000,
                                child: const ChatBotButtonWidget(
                                    route:
                                        '/chat_bot_view_body_with_birth_date'),
                              ),
                              SizedBox(
                                height: 10.v,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ));
  }
}
