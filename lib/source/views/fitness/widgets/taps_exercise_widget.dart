import 'package:fait/source/widgets/custome_slide_segmented_control_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum InfoExercise {
  Overview,
  Exercise,
  Muscles,
}

final infoExerciseProvider =
    StateProvider<InfoExercise>((ref) => InfoExercise.Overview);

class TapsExerciseWidget extends StatelessWidget {
  final void Function(InfoExercise?) onValueChanged;
  const TapsExerciseWidget({
    super.key,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final infoExercise = ref.watch(infoExerciseProvider);
        return Padding(
          padding: EdgeInsets.only(
            right: 14.h,
            left: 14.h,
          ),
          child: SizedBox(
            height: 60.v,
            width: 480.h,
            child: CustomSlideSegmentedControl<InfoExercise>(
              children: {
                InfoExercise.Overview: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Text(
                    "Overview",
                    style: theme.textTheme.titleLarge!,
                  ),
                ),
                InfoExercise.Exercise: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Text(
                    "Exercise",
                    style: theme.textTheme.titleLarge!,
                  ),
                ),
                InfoExercise.Muscles: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Text(
                    "Muscles",
                    style: theme.textTheme.titleLarge!,
                  ),
                ),
              },
              thumbColor: theme.colorScheme.primary,
              backgroundColor: appTheme.transparent,
              groupValue: infoExercise,
              onValueChanged: onValueChanged,
            ),
          ),
        );
      }),
    );
  }
}
