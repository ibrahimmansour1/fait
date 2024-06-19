import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/app_export.dart';
import '../../../providers/theme/theme_provider.dart';
import '../../../routes.dart';
import '../../../widgets/custom_future_animated_opacity_widget.dart';
import '../../loading_screen.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';
import '../widgets/chat_bot_button_widget.dart';

class ChatBotViewBodyWithToolsDetection extends ConsumerStatefulWidget {
  const ChatBotViewBodyWithToolsDetection({super.key});

  @override
  ConsumerState<ChatBotViewBodyWithToolsDetection> createState() =>
      _ChatBotViewBodyWithToolsDetectionState();
}

class _ChatBotViewBodyWithToolsDetectionState
    extends ConsumerState<ChatBotViewBodyWithToolsDetection> {
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

  String selectedOption = '';
  bool trainingStatus = false;

  void toggleTools(String tool) {
    setState(() {
      if (toolsList.contains(tool)) {
        toolsList.remove(tool);
      } else {
        toolsList.add(tool);
      }
    });
  }

  void selectTool(String tool) {
    setState(() {
      selectedOption = tool;
      trainingStatus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.watch(themeNotifierProvider);
    final mediaQueryData = MediaQuery.of(context);

    Widget buildToolOption(String option, IconData icon) {
      bool isSelected = selectedOption == option;
      Color borderColor = isSelected
          ? themeHelper.getThemeData().colorScheme.primary
          : Colors.transparent;
      Color iconBackgroundColor = isSelected
          ? themeHelper.getThemeData().colorScheme.primary
          : const Color(0xFF4C5A81);
      Color iconColor =
          isSelected ? Colors.white : Colors.white.withOpacity(0.5);
      Color textColor = isSelected
          ? themeHelper.getThemeData().colorScheme.primary
          : themeHelper.getThemeData().colorScheme.tertiary;

      return GestureDetector(
        onTap: () => selectTool(option),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 37),
          decoration: ShapeDecoration(
            color: themeHelper.getThemeData().colorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: borderColor),
              borderRadius: BorderRadius.circular(16.adaptSize),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 62.h,
                height: 62.v,
                decoration: ShapeDecoration(
                  color: iconBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(height: 18),
              Text(
                option,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: BoxDecoration(
          color: themeHelper.getThemeData().colorScheme.background,
        ),
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
                        buildToolOption('With Tools', Icons.fitness_center),
                        const SizedBox(width: 20),
                        buildToolOption(
                            'Without Tools', Icons.accessibility_new_rounded),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (selectedOption.isNotEmpty)
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 3000,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '  My Goal:',
                          style: themeHelper
                              .getThemeData()
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 32.fSize,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black),
                        ),
                        ChatMessageWidget(
                          message: "My training is $selectedOption",
                        ),
                        if (selectedOption == 'Without Tools')
                          const ChatMessageWidget(
                            message: "Nice Choice! Let's move on",
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 20),
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
                                  onSelected: (_) => toggleTools(tool),
                                );
                              }).toList(),
                            ),
                          ),
                      ],
                    ),
                  ),
                if (trainingStatus)
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 4000,
                    child: const ChatBotButtonWidget(
                      route: AppRoutes.loadingScreen,
                      page: LoadingScreen(),
                    ),
                  ),
                SizedBox(height: 20.v),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
