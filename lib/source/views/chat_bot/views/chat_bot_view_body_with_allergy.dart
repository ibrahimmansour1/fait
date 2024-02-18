import 'package:flutter/material.dart';
import '../../../../utils/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../widgets/chat_bot_button_widget.dart';
import '../widgets/chat_message_widget.dart';
import '../widgets/custom_chat_bot_app_bar.dart';

var messageController = TextEditingController();

class ChatBotViewBodyWithAllergy extends StatefulWidget {
  const ChatBotViewBodyWithAllergy({super.key});

  @override
  State<ChatBotViewBodyWithAllergy> createState() =>
      _ChatBotViewBodyWithAllergyState();
}

class _ChatBotViewBodyWithAllergyState
    extends State<ChatBotViewBodyWithAllergy> {
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomChatBotAppBar(),
                  // const ChatMessageWidget(message: 'then $name'),
                  const ChatMessageWidget(
                    message: 'Do you have any Allergy?',
                  ),
                  SizedBox(height: 10.v),
                  Text("Daily Food",
                      style: CustomTextStyles.titleLargeInter
                          .copyWith(color: Colors.white)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      itemCount: diaryFood.length,
                      itemBuilder: (context, index) {
                        final vegetable = diaryFood[index];
                        final isSelected =
                            selectedAllergies.contains(vegetable);
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
                              toggleAllergy(vegetable);
                            });
                      },
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text("Vegetables",
                      style: CustomTextStyles.titleLargeInter
                          .copyWith(color: Colors.white)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      itemCount: vegetables.length,
                      itemBuilder: (context, index) {
                        final vegetable = vegetables[index];
                        final isSelected =
                            selectedAllergies.contains(vegetable);
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
                              toggleAllergy(vegetable);
                            });
                      },
                    ),
                  ),

                  SizedBox(height: 10.v),
                  Text("Fruits",
                      style: CustomTextStyles.titleLargeInter
                          .copyWith(color: Colors.white)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      itemCount: fruits.length,
                      itemBuilder: (context, index) {
                        final fruit = fruits[index];
                        final isSelected = selectedAllergies.contains(fruit);
                        return ListTile(
                            title: Text(
                              fruit,
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
                              toggleAllergy(fruit);
                            });
                      },
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text("Grains",
                      style: CustomTextStyles.titleLargeInter
                          .copyWith(color: Colors.white)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      itemCount: grains.length,
                      itemBuilder: (context, index) {
                        final grain = grains[index];
                        final isSelected = selectedAllergies.contains(grain);
                        return ListTile(
                            title: Text(
                              grain,
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
                              toggleAllergy(grain);
                            });
                      },
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text("Meat",
                      style: CustomTextStyles.titleLargeInter
                          .copyWith(color: Colors.white)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      itemCount: meat.length,
                      itemBuilder: (context, index) {
                        final meatItem = meat[index];
                        final isSelected = selectedAllergies.contains(meatItem);
                        return ListTile(
                            title: Text(
                              meatItem,
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
                              toggleAllergy(meatItem);
                            });
                      },
                    ),
                  ),
                  SizedBox(height: 10.v),
                  const ChatMessageWidget(message: "Ok! Let's continue"),
                  const ChatBotButtonWidget(
                    route: '/chat_bot_workout_days',
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
