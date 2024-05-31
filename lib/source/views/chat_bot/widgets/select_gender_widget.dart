// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fait/source/providers/theme/theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:fait/utils/size_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/app_export.dart';
import '../../../widgets/custom_future_animated_opacity_widget.dart';
import '../views/chat_bot_view_body_with_gender.dart';
import 'chat_message_widget.dart';

class SelectGenderWidget extends ConsumerStatefulWidget {
  final ValueChanged<String> onGenderSelected;
  String selectedGender;
  SelectGenderWidget({
    Key? key,
    required this.selectedGender,
    required this.onGenderSelected,
  }) : super(key: key);

  @override
  ConsumerState<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends ConsumerState<SelectGenderWidget> {
  void selectGender(String gender) {
    setState(() {
      widget.selectedGender = gender;
    });
    widget.onGenderSelected(gender);
  }

  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.watch(themeNotifierProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectGender('Female');
                  });
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
                        color: widget.selectedGender == "Male"
                            ? themeHelper.themeColor().blueGray80004
                            : themeHelper.getThemeData().colorScheme.primary,
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
                          color: widget.selectedGender == "Male"
                              ? themeHelper.themeColor().blueGray80004
                              : themeHelper.getThemeData().colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Icon(
                          Icons.male_rounded,
                          color: widget.selectedGender == "Male"
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "Male",
                        style: TextStyle(
                          color: widget.selectedGender == "Male"
                              ? themeHelper.themeColor().blueGray80004
                              : themeHelper.getThemeData().colorScheme.primary,
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
                  setState(() {
                    selectGender('Male');
                  });
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
                        color: widget.selectedGender == "Female"
                            ? themeHelper.themeColor().blueGray80004
                            : themeHelper.getThemeData().colorScheme.primary,
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
                          color: widget.selectedGender == "Female"
                              ? themeHelper.themeColor().blueGray80004
                              : themeHelper.getThemeData().colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Icon(
                          Icons.male_rounded,
                          color: widget.selectedGender == "Female"
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "Female",
                        style: TextStyle(
                          color: widget.selectedGender == "Female"
                              ? themeHelper.themeColor().blueGray80004
                              : themeHelper.getThemeData().colorScheme.primary,
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
        widget.selectedGender != ''
            ? CustomFutureAnimatedOpacityWidget(
                waitingDurationInMilliSeconds: 1000,
                child: Text('  My Gender:',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontSize: 32.fSize)),
              )
            : const SizedBox(),
        SizedBox(height: 10.v),
        widget.selectedGender != ''
            ? CustomFutureAnimatedOpacityWidget(
                waitingDurationInMilliSeconds: 2000,
                child: ChatMessageWidget(
                  message: "Your gender is ${widget.selectedGender}",
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
