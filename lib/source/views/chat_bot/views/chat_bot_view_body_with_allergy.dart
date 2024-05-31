import 'package:fait/source/providers/theme/theme_provider.dart';
import 'package:fait/source/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/app_export.dart';
import '../../../widgets/custom_future_animated_opacity_widget.dart';
import '../widgets/chat_bot_button_widget.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithAllergy extends ConsumerStatefulWidget {
  const ChatBotViewBodyWithAllergy({super.key});

  @override
  ConsumerState<ChatBotViewBodyWithAllergy> createState() =>
      _ChatBotViewBodyWithAllergyState();
}

class _ChatBotViewBodyWithAllergyState
    extends ConsumerState<ChatBotViewBodyWithAllergy> {
  List<String> selectedAllergies = [];

  final List<String> diaryFood = [
    'Milk',
    'Eggs',
    'Wheat',
    'Soy',
    'Fish',
    'Shellfish',
    'Tree nuts',
    'Peanuts'
  ];
  final List<String> vegetables = [
    'Tomato',
    'Carrot',
    'Celery',
    'Onion',
    'Garlic',
    'Bell pepper',
    'Cucumber',
    'Mushroom'
  ];
  final List<String> fruits = [
    'Apple',
    'Banana',
    'Orange',
    'Strawberry',
    'Pineapple',
    'Grapes',
    'Watermelon',
    'Kiwi'
  ];
  final List<String> grains = [
    'Barley',
    'Buckwheat',
    'Corn',
    'Millet',
    'Oats',
    'Rice',
    'Rye',
    'Sorghum'
  ];
  final List<String> meat = [
    'Beef',
    'Pork',
    'Chicken',
    'Turkey',
    'Lamb',
    'Goat',
    'Duck',
    'Quail'
  ];

  void toggleAllergy(String vegetable) {
    setState(() {
      if (selectedAllergies.contains(vegetable)) {
        selectedAllergies.remove(vegetable);
      } else {
        selectedAllergies.add(vegetable);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.watch(themeNotifierProvider);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            color: themeHelper.getThemeData().colorScheme.background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomChatBotAppBar(),
                  // const ChatMessageWidget(message: 'then $name'),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 1000,
                    child: const ChatMessageWidget(
                      message: 'Do you have any Allergy?',
                    ),
                  ),
                  SizedBox(height: 10.v),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 2000,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Daily Food",
                            style: CustomTextStyles.titleLargeInter
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: diaryFood.map((vegetable) {
                              final isSelected =
                                  selectedAllergies.contains(vegetable);
                              return ChoiceChip(
                                label: Text(
                                  vegetable,
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
                                  toggleAllergy(vegetable);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10.v),
                        Text("Vegetables",
                            style: CustomTextStyles.titleLargeInter
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: vegetables.map((vegetable) {
                              final isSelected =
                                  selectedAllergies.contains(vegetable);
                              return ChoiceChip(
                                label: Text(
                                  vegetable,
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
                                  toggleAllergy(vegetable);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10.v),
                        Text("Fruits",
                            style: CustomTextStyles.titleLargeInter
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: fruits.map((fruit) {
                              final isSelected =
                                  selectedAllergies.contains(fruit);
                              return ChoiceChip(
                                label: Text(
                                  fruit,
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
                                  toggleAllergy(fruit);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10.v),
                        Text("Grains",
                            style: CustomTextStyles.titleLargeInter
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: grains.map((grain) {
                              final isSelected =
                                  selectedAllergies.contains(grain);
                              return ChoiceChip(
                                label: Text(
                                  grain,
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
                                  toggleAllergy(grain);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10.v),
                        Text("Meat",
                            style: CustomTextStyles.titleLargeInter
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: meat.map((meatItem) {
                              final isSelected =
                                  selectedAllergies.contains(meatItem);
                              return ChoiceChip(
                                label: Text(
                                  meatItem,
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
                                  toggleAllergy(meatItem);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.v),
                  CustomFutureAnimatedOpacityWidget(
                      waitingDurationInMilliSeconds: 4000,
                      child: const ChatMessageWidget(
                          message: "Ok! Let's continue")),
                  CustomFutureAnimatedOpacityWidget(
                    waitingDurationInMilliSeconds: 5000,
                    child: const ChatBotButtonWidget(
                      route: AppRoutes.chatBotWorkoutDays,
                    ),
                  ),
                  SizedBox(
                    height: 20.v,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
