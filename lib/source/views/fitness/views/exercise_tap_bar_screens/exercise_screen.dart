import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/exercise_card_widget.dart';
import '../exercise_info_screen.dart';
import 'exercise_muscles_screen.dart';
import 'exercise_overview_screen.dart';

// ignore_for_file: must_be_immutable
class ExerciseScreen extends StatelessWidget {
  ExerciseScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 22.v),
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.h),
                  child: _buildSetNoMuscle(context,
                      setText: "Set 1", setText1: "Quads & Back")),
              SizedBox(height: 30.v),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ExerciseCardWidget(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              useRootNavigator: true,
                              isScrollControlled: true,
                              builder: (_) => ExerciseInfoScreen(
                                    tryIt: true,
                                  ));
                        },
                      ),
                  separatorBuilder: (context, index) => SizedBox(height: 32.v),
                  itemCount: 2),
              SizedBox(height: 39.v),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.h),
                  child: _buildSetNoMuscle(context,
                      setText: "Set 2", setText1: "Butt & Lower Back")),
              SizedBox(height: 30.v),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ExerciseCardWidget(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              useRootNavigator: true,
                              isScrollControlled: true,
                              builder: (_) => ExerciseInfoScreen(
                                    tryIt: true,
                                  ));
                        },
                      ),
                  separatorBuilder: (context, index) => SizedBox(height: 32.v),
                  itemCount: 3),
            ]),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildSetNoMuscle(
    BuildContext context, {
    required String setText,
    required String setText1,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(setText,
          style: CustomTextStyles.headlineLargeSemiBold.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1))),
      Padding(
          padding: EdgeInsets.only(top: 9.v),
          child: Text(setText1,
              style: CustomTextStyles
                  .headlineSmallRobotoOnPrimaryContainerRegular
                  .copyWith(
                      color: theme.colorScheme.onPrimaryContainer
                          .withOpacity(0.75))))
    ]);
  }
}
