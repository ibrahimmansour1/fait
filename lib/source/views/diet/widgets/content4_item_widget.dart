import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

// ignore: must_be_immutable
class Content4ItemWidget extends StatelessWidget {
  final String text;
  const Content4ItemWidget({Key? key, required this.text})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        height: 43.v,
        width: 138.h,
        text: text,
        buttonStyle: CustomButtonStyles.fillBlueGrayTL8,
        buttonTextStyle: CustomTextStyles.bodyLargeOnPrimaryContainer_3);
  }
}
