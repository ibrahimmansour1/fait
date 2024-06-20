import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeekcardssetdefaultItemWidget extends StatelessWidget {
  String title;
  int number;
  bool selected;
  VoidCallback onTap;
  WeekcardssetdefaultItemWidget({
    Key? key,
    required this.title,
    required this.number,
    required this.selected,
    required this.onTap,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25.h,
          vertical: 17.v,
        ),
        decoration: BoxDecoration(
          color: selected
              ? theme.colorScheme.primary
              : theme.colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(10.h),
        ),
        width: 90.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: CustomTextStyles.bodyLarge18,
            ),
            SizedBox(height: 2.v),
            Text(
              number.toString(),
              style: CustomTextStyles.titleMediumOnPrimaryContainerBold,
            ),
          ],
        ),
      ),
    );
  }
}
