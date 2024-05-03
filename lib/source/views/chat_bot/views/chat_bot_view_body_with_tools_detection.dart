import 'package:fait/source/routes.dart';
import 'package:fait/source/views/chat_bot/widgets/chat_bot_button_widget.dart';
import 'package:fait/source/views/home/views/home_view.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_export.dart';
import '../../../widgets/custom_future_animated_opacity_widget.dart';
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
  bool isToolsSelected = false;
  bool trainingStatus = false;
  void toggleTools(String tool) {
    setState(() {
      if (toolsList.contains(tool)) {
        toolsList.remove(tool);
      } else {
        toolsList.add(tool);
      }
      isToolsSelected = true;
    });
  }

  String selectedOption = '';

  void selectTool(String tool) {
    setState(() {
      selectedOption = tool;
    });
    trainingStatus = true;
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
                    child: const ChatMessageWidget(
                      message: 'How will you exercise?',
                    ),
                  ),
                  SizedBox(height: 10.v),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 2000,
                    child: SingleChildScrollView(
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                  ),
                  const SizedBox(height: 20),
                  (selectedOption == "Without Tools")
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 5000,
                          child: Column(
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
                          ),
                        )
                      // : const SizedBox()
                      : CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 5000,
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: tools.map((tool) {
                              final isSelected = toolsList.contains(tool);
                              return ChoiceChip(
                                label: Text(
                                  tool,
                                  style: isSelected
                                      ? CustomTextStyles.titleLargeInter
                                          .copyWith(color: Colors.white)
                                      : CustomTextStyles.titleLargeInter
                                          .copyWith(color: Colors.white),
                                ),
                                selected: isSelected,
                                selectedColor: const Color(0xFF8394CA),
                                backgroundColor: const Color(0xFF353767),
                                onSelected: (_) {
                                  toggleTools(tool);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                  // : const SizedBox(),
                  const SizedBox(height: 10),
                  trainingStatus ? SizedBox(height: 280.v) : const SizedBox(),

                  trainingStatus
                      ? CustomFutureAnimatedOpacityWidget(
                          waitingDurationInMilliSeconds: 4000,
                          child: const ChatBotButtonWidget(
                            route: AppRoutes.home,
                            page: HomeView(),
                          ),
                        )
                      : const SizedBox(),

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
