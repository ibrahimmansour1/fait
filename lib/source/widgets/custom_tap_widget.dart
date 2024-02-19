import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTapWidget extends StatelessWidget {
  bool selected;
  String label;
  void Function(bool)? onSelected;
  CustomTapWidget(
      {Key? key, this.selected = false, this.onSelected, required this.label})
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
        label,
        style: TextStyle(
          color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 18.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: selected,
      backgroundColor: appTheme.blueGray80004,
      selectedColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        side: const BorderSide(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(
          8.h,
        ),
      ),
      onSelected: onSelected,
    );
  }
}
