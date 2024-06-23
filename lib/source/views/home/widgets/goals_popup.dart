import 'package:fait/source/views/home/widgets/add_new_goal_bottom_sheet.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalsPopup extends StatelessWidget {
  const GoalsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352.h,
      height: 156.v,
      padding: EdgeInsets.all(16.adaptSize),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 16.adaptSize,
                height: 16.adaptSize,
                decoration: ShapeDecoration(
                  color: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 4.adaptSize),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12.adaptSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) => Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    ref
                        .watch(goalTypeProvider.notifier)
                        .update((state) => 'Water achievement');
                    ref
                        .watch(targetProvider.notifier)
                        .update((state) => '(n) Ml');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Water achievement',
                    style: CustomTextStyles.bodyLargeDeeppurpleA200.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    ref
                        .watch(goalTypeProvider.notifier)
                        .update((state) => 'Running acievement');
                    ref
                        .watch(targetProvider.notifier)
                        .update((state) => '(n) Km');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Running acievement',
                    style: CustomTextStyles.bodyLargeDeeppurpleA200.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    ref
                        .watch(goalTypeProvider.notifier)
                        .update((state) => 'Calories losing');
                    ref
                        .watch(targetProvider.notifier)
                        .update((state) => '(n) Kcal');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Calories losing',
                    style: CustomTextStyles.bodyLargeDeeppurpleA200.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
