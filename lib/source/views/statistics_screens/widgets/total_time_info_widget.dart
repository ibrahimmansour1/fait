import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class TotalTimeInfoWidget extends StatelessWidget {
  const TotalTimeInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Time in bed",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.tertiary,
              )),
          Text("8h 32m",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.tertiary,
              )),
        ],
      ),
    );
  }
}
