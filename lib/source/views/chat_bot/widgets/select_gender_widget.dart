import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_export.dart';
import '../views/chat_bot_view_body_with_gender.dart';
import 'chat_message_widget.dart';

class SelectGenderWidget extends StatefulWidget {
  const SelectGenderWidget({
    super.key,
  });

  @override
  State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {
  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  selectGender('Male');
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
                        color: selectedGender == "Male"
                            ? const Color(0xFF17D1E0)
                            : const Color(0xFF4C5A81),
                      ),
                      borderRadius: BorderRadius.circular(16.adaptSize),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 62.h,
                        height: 62.v,
                        decoration: ShapeDecoration(
                          color: selectedGender == "Male"
                              ? const Color(0xFF17D1E0)
                              : const Color(0xFF4C5A81),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Icon(
                          Icons.male_rounded,
                          color: selectedGender == "Male"
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "Male",
                        style: TextStyle(
                          color: selectedGender == "Male"
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
              SizedBox(width: 20.h),
              GestureDetector(
                onTap: () {
                  selectGender('Female');
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
                        color: selectedGender == "Female"
                            ? const Color(0xFF17D1E0)
                            : const Color(0xFF4C5A81),
                      ),
                      borderRadius: BorderRadius.circular(16.adaptSize),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 62.h,
                        height: 62.v,
                        decoration: ShapeDecoration(
                          color: selectedGender == "Female"
                              ? const Color(0xFF17D1E0)
                              : const Color(0xFF4C5A81),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Icon(
                          Icons.male_rounded,
                          color: selectedGender == "Female"
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "Female",
                        style: TextStyle(
                          color: selectedGender == "Female"
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
        SizedBox(height: 20.v),
        Text('  My Gender:',
            style: theme.textTheme.bodyLarge!.copyWith(fontSize: 32.fSize)),
        ChatMessageWidget(
          message: "Your gender is $selectedGender",
        ),
      ],
    );
  }
}
