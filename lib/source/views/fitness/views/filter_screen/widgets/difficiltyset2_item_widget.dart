import 'package:flutter/material.dart';

import '../../../../../../utils/app_export.dart';

// ignore: must_be_immutable
class Difficiltyset2ItemWidget extends StatelessWidget {
  const Difficiltyset2ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 7.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Beginner",
        style: TextStyle(
          color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 18.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.blueGray80004,
      selectedColor: appTheme.blueGray80004,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          8.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
