import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithWorkoutDays extends StatefulWidget {
  const ChatBotViewBodyWithWorkoutDays({super.key});

  @override
  State<ChatBotViewBodyWithWorkoutDays> createState() =>
      _ChatBotViewBodyWithWorkoutDaysState();
}

class _ChatBotViewBodyWithWorkoutDaysState
    extends State<ChatBotViewBodyWithWorkoutDays> {
  List<String> selectedDays = [];

  final List<String> daysOfTheWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  void toggleDays(String day) {
    setState(() {
      if (selectedDays.contains(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: const BoxDecoration(color: Color(0xFF282B4C)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomChatBotAppBar(),
                // const ChatMessageWidget(message: 'then $name'),
                const ChatMessageWidget(
                  message: 'Which days do you workout?',
                ),
                SizedBox(height: 10.v),
                Text(
                  '  🗓️  Days',
                  style: CustomTextStyles.titleLargeInter
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    itemCount: daysOfTheWeek.length,
                    itemBuilder: (context, index) {
                      final vegetable = daysOfTheWeek[index];
                      final isSelected = selectedDays.contains(vegetable);
                      return ListTile(
                          title: Text(
                            vegetable,
                            style: isSelected
                                ? CustomTextStyles.titleLargeInter
                                : CustomTextStyles.titleLargeInter
                                    .copyWith(color: Colors.white),
                          ),
                          trailing: isSelected
                              ? const Icon(Icons.check_circle,
                                  color: Colors.white)
                              : null,
                          onTap: () {
                            toggleDays(vegetable);
                          });
                    },
                  ),
                ),
                SizedBox(height: 10.v),
                const ChatMessageWidget(message: "Ok! Let's continue"),
                const Spacer(),

                const ChatBotButtonWidget(
                    route: '/chat_bot_workout_tools_detection'),
                SizedBox(
                  height: 20.v,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
