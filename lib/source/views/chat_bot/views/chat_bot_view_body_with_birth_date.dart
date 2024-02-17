import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:fait/source/theme/custom_button_style.dart';
import 'package:fait/source/theme/custom_text_style.dart';
import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  void openDatePicker(BuildContext context) {
    BottomPicker.date(
      title: 'Set your Birthday',
      backgroundColor: const Color(0xFF1E2037),
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(2024, 2, 10),
      maxDateTime: DateTime(2050),
      minDateTime: DateTime(1980),
      pickerTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.white,
      ),
      onChange: (index) {
        setState(() {
          date = index.toString();
        });
        print(index);
      },
      onSubmit: (index) {
        setState(() {
          date = index.toString();
        });
        print(index);
      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }

  dynamic date = DateTime.now();
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
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF1E2037),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9.h,
                      child: Padding(
                        padding: EdgeInsets.all(16.0.v),
                        child: InkWell(
                          onTap: () {
                            openDatePicker(context);
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Select your Birthday',
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(fontSize: 24.fSize)),
                                  const Icon(
                                    Icons.calendar_view_day_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.v,
                              ),
                              Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  Text('  My Birthday is:',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontSize: 32.fSize)),
                  ChatMessageWidget(
                    message:
                        'Your BirthDay is ${DateFormat('dd/MM/yyyy').format(DateTime.parse(date.toString()))}',
                  ),
                  const ChatMessageWidget(
                    message: "Great! Let's Continue",
                  ),
                  const Spacer(),
                  const ChatBotButtonWidget(
                      route: '/chat_bot_view_body_with_height_and_weight'),
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
