import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/views/fitness/views/overview_screen/overview_screen.dart';
import 'package:fait/source/views/fitness/views/workout_tap_bar_screens/workout_group_screen.dart';
import 'package:fait/source/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/app_export.dart';
import '../../../../utils/transitions/fade_transition.dart';
import '../../../providers/fitness/fitness_plan_provider.dart';
import '../../../providers/theme/theme_provider.dart';

class ExercisesProgramWidget extends ConsumerStatefulWidget {
  const ExercisesProgramWidget({
    super.key,
  });

  @override
  ConsumerState<ExercisesProgramWidget> createState() =>
      _ExercisesProgramWidgetState();
}

class _ExercisesProgramWidgetState
    extends ConsumerState<ExercisesProgramWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(fitnessPlanProvider).getFitnessPlan();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeHelper = ref.watch(themeNotifierProvider);
    final fitnessPlanViewModel =
        ref.watch(fitnessPlanProvider).fitnessPlanResponse;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          'My Program',
          style: TextStyle(
            fontSize: 32.fSize,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        fitnessPlanViewModel.status == Status.completed
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        CustomImageView(
                          imagePath: fitnessPlanViewModel.data!.image ??
                              ImageConstant.imgBodyBalance,
                          height: 310.v,
                          width: 500.h,
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  appTheme.gray500111.withOpacity(
                                      0.4), // Adjust opacity as needed
                                  appTheme.white
                                      .withOpacity(0.01), // Fully transparent
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '1 Workout',
                                  // '${fitnessPlanViewModel.data!.numberOfWorkouts} Workout',
                                  style: TextStyle(
                                    fontSize: 20.fSize,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '1 Exercise',
                                  // '${fitnessPlanViewModel.data!.numberOfExercises} Exercise',
                                  style: TextStyle(
                                    fontSize: 18.fSize,
                                    color: Colors.white.withOpacity(0.75),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 160.h),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  FadePageRouteBuilder(
                                    page: WorkoutGroupScreen(
                                      fitnessPlanId:
                                          fitnessPlanViewModel.data!.id!,
                                    ),
                                    duration: const Duration(milliseconds: 800),
                                  ),
                                );
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.menu_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 10.h),
                            SizedBox(height: 42.h),
                            // const Icon(
                            //   CupertinoIcons.heart,
                            //   color: Colors.white,
                            // ),
                            SizedBox(height: 160.h),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  FadePageRouteBuilder(
                                    page: const OverviewScreen(),
                                    duration: const Duration(milliseconds: 800),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        themeHelper.themeColor().blueGray80004,
                                    borderRadius: BorderRadius.circular(35)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Start',
                                        style: TextStyle(
                                          fontSize: 20.fSize,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Icon(
                                        (Icons.arrow_forward_ios_rounded),
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ],
    );
  }
}
