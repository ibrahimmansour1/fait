import 'package:fait/source/routes.dart';
import 'package:fait/source/theme/app_colors.freezed.dart';
import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_export.dart';
import '../../../widgets/custom_future_animated_opacity_widget.dart';
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
  bool isInjuriesSelected = false;
  void toggleInjury(String injury) {
    setState(() {
      if (selectedInjuries.contains(injury)) {
        selectedInjuries.remove(injury);
      } else {
        selectedInjuries.add(injury);
      }
      isInjuriesSelected = true;
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomChatBotAppBar(),
                CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 1000,
                    child: const ChatMessageWidget(message: 'Awesome')),
                CustomFutureAnimatedOpacityWidget(
                  waitingDurationInMilliSeconds: 2000,
                  child: const ChatMessageWidget(
                    message: 'Select your injuries from the list below',
                  ),
                ),
                SizedBox(height: 10.v),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 3000,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: availableInjuries.map((injury) {
                        final isSelected = selectedInjuries.contains(injury);
                        return ChoiceChip(
                          label: Text(
                            injury,
                            style: isSelected
                                ? CustomTextStyles.titleLargeInter
                                : CustomTextStyles.titleLargeInter
                                    .copyWith(color: Colors.white),
                          ),
                          selected: isSelected,
                          onSelected: (selected) {
                            toggleInjury(injury);
                          },
                          selectedColor: const Color(0xFF8394CA),
                          labelStyle: const TextStyle(color: Colors.white),
                          backgroundColor: const Color(0xFF353767),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                isInjuriesSelected
                    ? CustomFutureAnimatedOpacityWidget(
                        waitingDurationInMilliSeconds: 1000,
                        child: const ChatMessageWidget(
                            message: "Ok! Let's continue"))
                    : const SizedBox(),
                // const Spacer(),
                isInjuriesSelected
                    ? CustomFutureAnimatedOpacityWidget(
                        waitingDurationInMilliSeconds: 2000,
                        child: const ChatBotButtonWidget(
                          route: AppRoutes.chatBotAllergy,
                        ))
                    : const SizedBox(),
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
