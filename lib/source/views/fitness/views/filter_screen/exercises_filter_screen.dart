import 'package:fait/source/views/fitness/views/exercises_results_screen.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/app_bar/appbar_subtitle_three.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_search_view.dart';
import '../../../../widgets/custom_tap_widget.dart';

// ignore_for_file: must_be_immutable
class ExercisesFilterScreen extends StatelessWidget {
  ExercisesFilterScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  final musclesProvider = StateProvider<List<String>>((ref) {
    return [];
  });
  final equipmentsProvider = StateProvider<List<String>>((ref) {
    return [];
  });
  final typeProvider = StateProvider<List<String>>((ref) {
    return [];
  });
  final difficultyProvider = StateProvider<List<String>>((ref) {
    return [];
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          decoration: AppDecoration.fillBlueGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder22
                  .copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero)),
          padding: const EdgeInsets.all(8),
          child: Consumer(builder: (context, ref, child) {
            List<String> muscles = ref.watch(musclesProvider);
            List<String> equipments = ref.watch(equipmentsProvider);
            List<String> types = ref.watch(typeProvider);
            List<String> difficulty = ref.watch(difficultyProvider);

            return Column(
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
                              onTapReset(context, muscles, equipments, types,
                                  difficulty);
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
                      child:
                          Text("Muscles", style: theme.textTheme.titleLarge)),
                  SizedBox(height: 32.v),
                  _buildMusclesSet(context, muscles),
                  SizedBox(height: 32.v),
                  Padding(
                      padding: EdgeInsets.only(left: 32.h),
                      child: Text("Equipments",
                          style: theme.textTheme.titleLarge)),
                  SizedBox(height: 30.v),
                  _buildEquipmentSet(context, equipments),
                  SizedBox(height: 33.v),
                  Padding(
                      padding: EdgeInsets.only(left: 32.h),
                      child: Text("Type", style: theme.textTheme.titleLarge)),
                  SizedBox(height: 29.v),
                  _buildTypeSet(context, types),
                  SizedBox(height: 32.v),
                  Padding(
                      padding: EdgeInsets.only(left: 32.h),
                      child: Text("Difficulty",
                          style: theme.textTheme.titleLarge)),
                  SizedBox(height: 30.v),
                  _buildDifficiltySet(context, difficulty),
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
                ]);
          })),
    );
  }

  /// Section Widget
  Widget _buildMusclesSet(BuildContext context, List<String> muscles) {
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
                      selected: muscles.contains('All'),
                      onSelected: (value) {
                        if (value) {
                          muscles.remove('All');
                        } else {
                          muscles.clear();
                          muscles.add('All');
                        }
                      },
                    );
                  }
                  return CustomTapWidget(
                    label: 'Glutes',
                    selected: muscles.contains('Glutes$index'),
                    onSelected: (value) {
                      if (value) {
                        muscles.remove('Glutes$index');
                      } else {
                        muscles.add('Glutes$index');
                      }
                    },
                  );
                })));
  }

  /// Section Widget
  Widget _buildEquipmentSet(BuildContext context, List<String> equipments) {
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
                      selected: equipments.contains('All'),
                      onSelected: (value) {
                        if (value) {
                          equipments.remove('All');
                        } else {
                          equipments.clear();
                          equipments.add('All');
                        }
                      },
                    );
                  }
                  return CustomTapWidget(
                    label: 'Bands',
                    selected: equipments.contains('Bands$index'),
                    onSelected: (value) {
                      if (value) {
                        equipments.remove('Bands$index');
                      } else {
                        equipments.add('Bands$index');
                      }
                    },
                  );
                })));
  }

  /// Section Widget
  Widget _buildTypeSet(BuildContext context, List<String> types) {
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
                    selected: types.contains('Strength$index'),
                    onSelected: (value) {
                      if (value) {
                        types.remove('Strength$index');
                      } else {
                        types.add('Strength$index');
                      }
                    },
                  );
                })));
  }

  /// Section Widget
  Widget _buildDifficiltySet(BuildContext context, List<String> difficulty) {
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
                    selected: difficulty.contains('Beginner'),
                    onSelected: (value) {
                      if (value) {
                        difficulty.remove('Beginner');
                      } else {
                        difficulty.add('Beginner');
                      }
                    },
                  ),
                  SizedBox(width: 16.h),
                  CustomTapWidget(
                    label: 'Intermediate',
                    selected: difficulty.contains('Intermediate'),
                    onSelected: (value) {
                      if (value) {
                        difficulty.remove('Intermediate');
                      } else {
                        difficulty.add('Intermediate');
                      }
                    },
                  ),
                  SizedBox(width: 16.h),
                  CustomTapWidget(
                    label: 'Expert',
                    selected: difficulty.contains('Expert'),
                    onSelected: (value) {
                      if (value) {
                        difficulty.remove('Expert');
                      } else {
                        difficulty.add('Expert');
                      }
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
  onTapReset(BuildContext context, List<String> muscles,
      List<String> equipments, List<String> types, List<String> difficulty) {
    muscles.clear();
    equipments.clear();
    types.clear();
    difficulty.clear();
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
