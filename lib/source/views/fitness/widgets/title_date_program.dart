import 'package:fait/utils/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleDateProgram extends StatelessWidget {
  final String buildText;
  final String yourBodyText;
  final String dateText;
  final String dateNumberText;
  const TitleDateProgram({
    super.key,
    required this.buildText,
    required this.dateText,
    required this.dateNumberText,
    required this.yourBodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.h, right: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: buildText,
                          style: theme.textTheme.displayMedium),
                      const TextSpan(text: " ")
                    ]),
                    textAlign: TextAlign.left),
                SizedBox(height: 14.v),
                Text(yourBodyText,
                    style: CustomTextStyles
                        .displayMediumOnPrimaryContainerRegular),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 100.v,
            child: VerticalDivider(
                width: 2.h, thickness: 2.v, indent: 5.h, endIndent: 46.h),
          ),
          Padding(
            padding: EdgeInsets.only(left: 19.h, bottom: 42.v),
            child: Column(
              children: [
                Text(dateText,
                    style: CustomTextStyles.bodyLargeOnPrimaryContainer_2),
                SizedBox(height: 1.v),
                Text(dateNumberText,
                    style: CustomTextStyles.headlineLargeRegular),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
