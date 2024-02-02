import 'package:fait/source/widgets/custome_slide_segmented_control_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum InfoProgram {
  Overview,
  Workout,
  Muscles,
}

final infoProgramProvider =
    StateProvider<InfoProgram>((ref) => InfoProgram.Overview);

class TapsProgramWidget extends StatelessWidget {
  final void Function(InfoProgram?) onValueChanged;
  const TapsProgramWidget({
    super.key,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final infoProgram = ref.watch(infoProgramProvider);
        return Padding(
          padding: EdgeInsets.only(
            right: 14.h,
            left: 14.h,
          ),
          child: SizedBox(
            height: 60.v,
            width: 480.h,
            child: CustomSlideSegmentedControl<InfoProgram>(
              children: {
                InfoProgram.Overview: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Text(
                    "Overview",
                    style: theme.textTheme.titleLarge!,
                  ),
                ),
                InfoProgram.Workout: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Text(
                    "Workout",
                    style: theme.textTheme.titleLarge!,
                  ),
                ),
                InfoProgram.Muscles: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Text(
                    "Muscles",
                    style: theme.textTheme.titleLarge!,
                  ),
                ),
              },
              thumbColor: theme.colorScheme.primary,
              backgroundColor: appTheme.transparent,
              groupValue: infoProgram,
              onValueChanged: onValueChanged,
            ),
          ),
        );
      }),
    );
  }
}
