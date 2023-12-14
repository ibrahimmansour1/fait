import 'package:fait/source/theme/app_decoration.dart';
import 'package:fait/source/theme/custom_button_style.dart';
import 'package:fait/source/theme/custom_text_style.dart';
import 'package:fait/source/theme/theme_helper.dart';
import 'package:fait/source/views/chat_bot/widgets/build_send_message_widget.dart';
import 'package:fait/source/views/chat_bot/widgets/custom_chat_bot_app_bar.dart';
import 'package:fait/source/views/onboarding/widgets/onboarding_item_widget.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/source/widgets/custom_image_view.dart';
import 'package:fait/utils/image_constant.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

final messageController = TextEditingController();
Future<void> showMessages() async {
  await Future.delayed(const Duration(seconds: 1));
  // Show first message
  const ChatMessageWidget(message: 'message');

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

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key});

  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  bool _showMessages = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      setState(() {
        _showMessages = true;
      });
    });
    super.initState();
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0, 0.51),
              end: const Alignment(0.95, 0.66),
              colors: [
                theme.colorScheme.onPrimary,
                appTheme.blueGray800,
                appTheme.blueGray80001
              ],
            ),
          ),
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  const CustomChatBotAppBar(),
                  const ChatMessageWidget(
                    message: 'message',
                    timeInSeconds: 1,
                  ),
                  const ChatMessageWidget(
                    message: 'message',
                    isReceiver: true,
                    timeInSeconds: 1,
                  ),
                  ChatMessageWidget(
                    message: messageController.text,
                    isReceiver: false,
                    timeInSeconds: 1,
                  ),
                  const Spacer(),
                  const BuildSendMessageWidget(
                      // messageController: messageController,
                      ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ChatMessageWidget extends StatelessWidget {
  final String message;
  final bool isReceiver;
  final int? timeInSeconds;
  const ChatMessageWidget({
    Key? key,
    required this.message,
    this.isReceiver = false,
    this.timeInSeconds = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeInSeconds != 0
        ? Future.delayed(Duration(seconds: timeInSeconds!)).then((value) {
            return FittedBox(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isReceiver
                      ? const Color(0xFF353767)
                      : const Color(0xFF8394CA),
                  borderRadius: isReceiver
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        )
                      : const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                ),
                alignment:
                    isReceiver ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          })
        : const Scaffold(
            body: Text('Empty'),
          );
    return const SizedBox();
  }
}
