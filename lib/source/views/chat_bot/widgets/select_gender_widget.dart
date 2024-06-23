import 'package:fait/source/providers/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/app_export.dart';
import '../../../widgets/custom_future_animated_opacity_widget.dart';
import '../views/chat_bot_view_body_with_gender.dart';
import 'chat_message_widget.dart';

class SelectGenderWidget extends ConsumerStatefulWidget {
  final ValueChanged<String> onGenderSelected;
  final String selectedGender;

  const SelectGenderWidget({
    Key? key,
    required this.selectedGender,
    required this.onGenderSelected,
  }) : super(key: key);

  @override
  ConsumerState<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends ConsumerState<SelectGenderWidget> {
  String _selectedGender = '';

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.selectedGender;
  }

  void selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
    widget.onGenderSelected(gender);
  }

  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.watch(themeNotifierProvider);
    final themeData = themeHelper.getThemeData();

    Widget buildGenderOption(String gender, IconData icon) {
      bool isSelected = _selectedGender == gender;
      Color borderColor =
          isSelected ? themeData.colorScheme.primary : Colors.transparent;
      Color iconBackgroundColor =
          isSelected ? themeData.colorScheme.primary : const Color(0xFF4C5A81);
      Color iconColor =
          isSelected ? Colors.white : Colors.white.withOpacity(0.5);
      Color textColor = isSelected
          ? themeData.colorScheme.primary
          : themeHelper.getThemeData().colorScheme.tertiary;

      return GestureDetector(
        onTap: () => selectGender(gender),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 37),
          decoration: ShapeDecoration(
            color: themeData.colorScheme.onPrimaryContainer,
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
                gender,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildGenderOption('Male', Icons.male_rounded),
              SizedBox(width: 20.h),
              buildGenderOption('Female', Icons.female_rounded),
            ],
          ),
        ),
        SizedBox(height: 20.v),
        if (_selectedGender.isNotEmpty) ...[
          CustomFutureAnimatedOpacityWidget(
            waitingDurationInMilliSeconds: 1000,
            child: Text(
              '  My Gender:',
              style: themeData.textTheme.bodyLarge!.copyWith(
                  fontSize: 32.fSize,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
            ),
          ),
          SizedBox(height: 10.v),
          CustomFutureAnimatedOpacityWidget(
            waitingDurationInMilliSeconds: 2000,
            child: ChatMessageWidget(
              message: "Your gender is $_selectedGender",
            ),
          ),
        ],
      ],
    );
  }
}
