import 'package:flutter/cupertino.dart';

class CustomSlideSegmentedControl<T> extends StatelessWidget {
  final T groupValue;
  final ValueChanged<T?> onValueChanged;
  final Map<T, Widget> children;
  final Color thumbColor;
  final Color backgroundColor;

  const CustomSlideSegmentedControl({
    super.key,
    required this.groupValue,
    required this.onValueChanged,
    required this.children,
    required this.thumbColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<T>(
      children: children,
      thumbColor: thumbColor,
      backgroundColor: backgroundColor,
      groupValue: groupValue,
      onValueChanged: onValueChanged,
    );
  }
}
