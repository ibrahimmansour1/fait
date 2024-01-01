import 'package:fait/source/views/chat_bot/widgets/gender_widget.dart';
import 'package:flutter/material.dart';

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GenderWidget(
          type: 'Female',
          icon: Icons.female,
          isMale: true,
        ),
        GenderWidget(
          type: 'Female',
          icon: Icons.male,
          isMale: false,
        ),
      ],
    );
  }
}
