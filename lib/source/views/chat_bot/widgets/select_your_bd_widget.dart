import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:fait/source/theme/theme_helper.dart';
import 'package:fait/source/views/chat_bot/widgets/gender_widget.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void _openDatePicker(BuildContext context) {
  BottomPicker.date(
    title: 'Set your Birthday',
    backgroundColor: const Color(0xFF1E2037),
    dateOrder: DatePickerDateOrder.dmy,
    initialDateTime: DateTime(1996, 10, 22),
    maxDateTime: DateTime(1998),
    minDateTime: DateTime(1980),
    pickerTextStyle: const TextStyle(
      color: Color(0xFF1E2037),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Color(0xFF1E2037),
    ),
    onChange: (index) {
      print(index);
    },
    onSubmit: (index) {
      print(index);
    },
    bottomPickerTheme: BottomPickerTheme.plumPlate,
  ).show(context);
}

class SelectYourBirthDayWidget extends StatelessWidget {
  const SelectYourBirthDayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF1E2037),
        ),
        width: MediaQuery.of(context).size.width * 0.9.h,
        height: 100,
        child: Padding(
          padding: EdgeInsets.all(16.0.v),
          child: InkWell(
            onTap: () {
              _openDatePicker(context);
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select your Birthday',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(fontSize: 24.fSize)),
                    const Icon(
                      Icons.calendar_view_day_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.v,
                ),
                Container(
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
