import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithInjures extends StatefulWidget {
  const ChatBotViewBodyWithInjures({super.key});

  @override
  State<ChatBotViewBodyWithInjures> createState() =>
      _ChatBotViewBodyWithInjuresState();
}

class _ChatBotViewBodyWithInjuresState
    extends State<ChatBotViewBodyWithInjures> {
  List<String> selectedInjuries = [];

  final List<String> availableInjuries = [
    'Sprained ankle',
    'Broken arm',
    'Concussion',
    'Fractured rib',
    'Torn ACL',
    'Dislocated shoulder',
    'Pulled muscle',
    'Whiplash',
    'Burns',
    'Bruises',
    'Cuts',
    'Strained back',
    'Twisted knee',
    'Sprained wrist',
    'Head injury',
    'Stress fracture',
    'Tennis elbow',
    'Shin splints',
    'Plantar fasciitis',
    'Rotator cuff tear',
  ];

  void toggleInjury(String injury) {
    setState(() {
      if (selectedInjuries.contains(injury)) {
        selectedInjuries.remove(injury);
      } else {
        selectedInjuries.add(injury);
      }
    });
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
        decoration: const BoxDecoration(color: Color(0xFF282B4C)),
        child: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomChatBotAppBar(),
                const ChatMessageWidget(message: 'Awesome'),
                const ChatMessageWidget(
                  message: 'Select your injuries from the list below',
                ),
                SizedBox(height: 10.v),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ListView.builder(
                    itemCount: availableInjuries.length,
                    itemBuilder: (context, index) {
                      final injury = availableInjuries[index];
                      final isSelected = selectedInjuries.contains(injury);
                      return ListTile(
                          title: Text(
                            injury,
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
                            toggleInjury(injury);
                          });
                    },
                  ),
                ),
                SizedBox(height: 10.v),
                const ChatMessageWidget(message: "Ok! Let's continue"),
                const Spacer(),
                const ChatBotButtonWidget(route: '/chat_bot_allergy'),
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
