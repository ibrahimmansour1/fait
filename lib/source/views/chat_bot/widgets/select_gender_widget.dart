import 'package:fait/source/views/chat_bot/widgets/gender_widget.dart';
import 'package:flutter/material.dart';

import '../views/chat_bot_view_body_with_gender.dart';

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            isMale = false;
            isFemale = true;
          },
          child: const GenderWidget(
            type: 'Female',
            icon: Icons.female,
          ),
        ),
        InkWell(
          onTap: () {
            isFemale = false;
            isMale = true;
          },
          child: const GenderWidget(
            type: 'Male',
            icon: Icons.male,
          ),
        ),
      ],
    );
  }
}
