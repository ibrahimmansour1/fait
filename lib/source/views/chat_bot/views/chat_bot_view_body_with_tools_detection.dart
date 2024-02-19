import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:fait/source/views/home/views/home_view.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_export.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithToolsDetection extends StatefulWidget {
  const ChatBotViewBodyWithToolsDetection({super.key});

  @override
  State<ChatBotViewBodyWithToolsDetection> createState() =>
      _ChatBotViewBodyWithToolsDetectionState();
}

class _ChatBotViewBodyWithToolsDetectionState
    extends State<ChatBotViewBodyWithToolsDetection> {
  List<String> toolsList = [];

  final List<String> tools = [
    'Treadmill',
    'Stationary Bicycle',
    'Rowing Machine',
    'Elliptical',
    'Dumbbells',
    'Barbell',
    'Bench Press',
    'Pull-up Bar',
    'Kettlebells',
    'Medicine Balls',
    'Resistance Bands',
    'Stability Ball',
    'Yoga Mat',
    'Foam Roller',
    'Punching Bag',
    'Jump Rope',
    'Weight Plates',
    'Cable Pulley Machine',
    'Leg Press Machine',
    'Smith Machine'
  ];

  void toggleDays(String tool) {
    setState(() {
      if (toolsList.contains(tool)) {
        toolsList.remove(tool);
      } else {
        toolsList.add(tool);
      }
    });
  }

  String selectedOption = '';

  void selectTool(String tool) {
    setState(() {
      selectedOption = tool;
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
                  const ChatMessageWidget(
                    message: 'How will you exercise?',
                  ),
                  SizedBox(height: 10.v),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20.h),
                        GestureDetector(
                          onTap: () {
                            selectTool('With Tools');
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 18,
                              left: 37,
                              right: 36,
                              bottom: 20,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF353767),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 3,
                                  color: selectedOption == "With Tools"
                                      ? const Color(0xFF17D1E0)
                                      : const Color(0xFF4C5A81),
                                ),
                                borderRadius:
                                    BorderRadius.circular(16.adaptSize),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 62.h,
                                  height: 62.v,
                                  decoration: ShapeDecoration(
                                    color: selectedOption == "With Tools"
                                        ? const Color(0xFF17D1E0)
                                        : const Color(0xFF4C5A81),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.fitness_center,
                                    color: selectedOption == "With Tools"
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  "With Tools",
                                  style: TextStyle(
                                    color: selectedOption == "With Tools"
                                        ? const Color(0xFF17D1E0)
                                        : const Color(0xFF4C5A81),
                                    fontSize: 16.fSize,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            selectTool('Without Tools');
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 18,
                              left: 37,
                              right: 36,
                              bottom: 20,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF353767),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 3,
                                  color: selectedOption == "Without Tools"
                                      ? const Color(0xFF17D1E0)
                                      : const Color(0xFF4C5A81),
                                ),
                                borderRadius:
                                    BorderRadius.circular(16.adaptSize),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 62.h,
                                  height: 62.v,
                                  decoration: ShapeDecoration(
                                    color: selectedOption == "Without Tools"
                                        ? const Color(0xFF17D1E0)
                                        : const Color(0xFF4C5A81),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.accessibility_new_rounded,
                                    color: selectedOption == "Without Tools"
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  "Without Tools",
                                  style: TextStyle(
                                    color: selectedOption == "Without Tools"
                                        ? const Color(0xFF17D1E0)
                                        : const Color(0xFF4C5A81),
                                    fontSize: 16.fSize,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  selectedOption == "Without Tools"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('  My Goal:',
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(fontSize: 32.fSize)),
                            ChatMessageWidget(
                                message: "My training is $selectedOption"),
                            const ChatMessageWidget(
                                message: "Nice Choice! Let's move on"),
                          ],
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: ListView.builder(
                            itemCount: tools.length,
                            itemBuilder: (context, index) {
                              final tool = tools[index];
                              final isSelected = toolsList.contains(tool);
                              return ListTile(
                                  title: Text(
                                    tool,
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
                                    toggleDays(tool);
                                  });
                            },
                          ),
                        ),
                  const Spacer(),
                  const ChatBotButtonWidget(
                    route: '/home',
                    page: HomeView(),
                  ),
                  SizedBox(
                    height: 20.v,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
