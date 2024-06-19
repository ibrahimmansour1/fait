import 'package:fait/source/providers/exercise/exercises_filter_provider.dart';
import 'package:fait/source/views/fitness/views/exercises_results_screen.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/app_bar/appbar_subtitle_three.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_search_view.dart';
import '../../../../widgets/custom_tap_widget.dart';

// ignore_for_file: must_be_immutable
class ExercisesFilterScreen extends ConsumerStatefulWidget {
  const ExercisesFilterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ExercisesFilterScreen> createState() =>
      _ExercisesFilterScreenState();
}

class _ExercisesFilterScreenState extends ConsumerState<ExercisesFilterScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final exercisesFilterViewModel = ref.watch(exercisesFilterProvider);
    return SingleChildScrollView(
      child: Container(
        decoration: AppDecoration.fillBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder22
                .copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero)),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconButton(
                    onPressed: () => onTapArrowLeft(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.v),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "Filters",
                      style: CustomTextStyles.titleLargeBold
                          .copyWith(fontSize: 24.fSize),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AppbarSubtitleThree(
                      text: "Rest",
                      margin: EdgeInsets.fromLTRB(32.h, 15.v, 32.h, 23.v),
                      onTap: () {
                        onTapReset(exercisesFilterViewModel);
                      }),
                )
              ],
            ),
            SizedBox(
              height: 22.v,
            ),
            Align(
                alignment: Alignment.center,
                child: CustomSearchView(
                    width: 280.h,
                    controller: searchController,
                    hintText: "Search",
                    autofocus: false,
                    alignment: Alignment.center)),
            SizedBox(height: 30.v),
            Padding(
                padding: EdgeInsets.only(left: 32.h),
                child: Text("Muscles", style: theme.textTheme.titleLarge)),
            SizedBox(height: 32.v),
            _buildMusclesSet(context, exercisesFilterViewModel),
            SizedBox(height: 32.v),
            Padding(
                padding: EdgeInsets.only(left: 32.h),
                child: Text("Equipments", style: theme.textTheme.titleLarge)),
            SizedBox(height: 30.v),
            _buildEquipmentSet(context, exercisesFilterViewModel),
            SizedBox(height: 33.v),
            Padding(
                padding: EdgeInsets.only(left: 32.h),
                child: Text("Type", style: theme.textTheme.titleLarge)),
            SizedBox(height: 29.v),
            _buildTypeSet(context, exercisesFilterViewModel),
            SizedBox(height: 32.v),
            Padding(
                padding: EdgeInsets.only(left: 32.h),
                child: Text("Difficulty", style: theme.textTheme.titleLarge)),
            SizedBox(height: 30.v),
            _buildDifficiltySet(context, exercisesFilterViewModel),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.all(30.adaptSize),
              child: CustomElevatedButton(
                  height: 48.v,
                  text: "See Results",
                  buttonStyle: CustomButtonStyles.fillPrimaryTL12,
                  buttonTextStyle: theme.textTheme.titleLarge!,
                  onPressed: () {
                    onTapSeeResults(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMusclesSet(
      BuildContext context, ExercisesFilterNotifier exercisesFilterViewModel) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 37.v,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 32.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16.h);
                },
                itemCount: 12,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return CustomTapWidget(
                      label: 'All',
                      selected:
                          exercisesFilterViewModel.muscles.contains('All'),
                      onSelected: (value) {
                        exercisesFilterViewModel.toggleMuscle("All");
                      },
                    );
                  }
                  return CustomTapWidget(
                    label: 'Glutes',
                    selected: exercisesFilterViewModel.muscles
                        .contains('Glutes$index'),
                    onSelected: (value) {
                      exercisesFilterViewModel.toggleMuscle('Glutes$index');
                    },
                  );
                })));
  }

  /// Section Widget
  Widget _buildEquipmentSet(
      BuildContext context, ExercisesFilterNotifier exercisesFilterViewModel) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 37.v,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 32.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16.h);
                },
                itemCount: 12,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return CustomTapWidget(
                      label: 'All',
                      selected:
                          exercisesFilterViewModel.equipments.contains('All'),
                      onSelected: (value) {
                        exercisesFilterViewModel.toggleEquipment("All");
                      },
                    );
                  }
                  return CustomTapWidget(
                    label: 'Bands',
                    selected: exercisesFilterViewModel.equipments
                        .contains('Bands$index'),
                    onSelected: (value) {
                      exercisesFilterViewModel.toggleEquipment('Bands$index');
                    },
                  );
                })));
  }

  /// Section Widget
  Widget _buildTypeSet(
      BuildContext context, ExercisesFilterNotifier exercisesFilterViewModel) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 37.v,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 32.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16.h);
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CustomTapWidget(
                    label: 'Strength',
                    selected: exercisesFilterViewModel.types
                        .contains('Strength$index'),
                    onSelected: (value) {
                      exercisesFilterViewModel.toggleType('Strength$index');
                    },
                  );
                })));
  }

  /// Section Widget
  Widget _buildDifficiltySet(
      BuildContext context, ExercisesFilterNotifier exercisesFilterViewModel) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 37.v,
            child: ListView(
                padding: EdgeInsets.only(left: 32.h),
                scrollDirection: Axis.horizontal,
                children: [
                  CustomTapWidget(
                    label: 'Beginner',
                    selected: exercisesFilterViewModel.difficulty
                        .contains('Beginner'),
                    onSelected: (value) {
                      exercisesFilterViewModel.toggleDifficulty('Beginner');
                    },
                  ),
                  SizedBox(width: 16.h),
                  CustomTapWidget(
                    label: 'Intermediate',
                    selected: exercisesFilterViewModel.difficulty
                        .contains('Intermediate'),
                    onSelected: (value) {
                      exercisesFilterViewModel.toggleDifficulty('Intermediate');
                    },
                  ),
                  SizedBox(width: 16.h),
                  CustomTapWidget(
                    label: 'Expert',
                    selected:
                        exercisesFilterViewModel.difficulty.contains('Expert'),
                    onSelected: (value) {
                      exercisesFilterViewModel.toggleDifficulty('Expert');
                    },
                  ),
                  SizedBox(width: 16.h),
                ])));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the filterOneScreen when the action is triggered.
  onTapReset(ExercisesFilterNotifier exercisesFilterViewModel) {
    exercisesFilterViewModel.reset();
  }

  /// Navigates to the resultsScreen when the action is triggered.
  onTapSeeResults(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (_) => const ExercisesResultsScreen());
  }
}
