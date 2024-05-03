import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../api/api_response.dart';
import '../../../../models/fitness/muscle_model.dart';
import '../../../../providers/fitness/fitness_plan_provider.dart';
import '../../widgets/muscle_widget.dart';

// ignore_for_file: must_be_immutable
class WorkoutMusclesScreen extends ConsumerStatefulWidget {
  final int fitnessPlanId;

  const WorkoutMusclesScreen({super.key, required this.fitnessPlanId});

  @override
  ConsumerState<WorkoutMusclesScreen> createState() =>
      _WorkoutMusclesScreenState();
}

class _WorkoutMusclesScreenState extends ConsumerState<WorkoutMusclesScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .watch(fitnessPlanProvider)
          .getFitnessPlanMuscles(widget.fitnessPlanId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fitnessPlanMusclesViewModel =
        ref.watch(fitnessPlanProvider).fitnessPlanMusclesResponse;
    return fitnessPlanMusclesViewModel.status != Status.completed
        ? const Center(
            child: CircularProgressIndicator(),
          )
        :  Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 60.h, right: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Main", style: CustomTextStyles.titleLargeYellow900),
              Text(
                "Secondary",
                style: CustomTextStyles.titleLargeBrown900,
              ),
            ],
          ),
        ),
        SizedBox(height: 30.v),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMusclesList(fitnessPlanMusclesViewModel.data!.where((element) => element.isMain!).toList()),
              Container(
                width: 1.h,
                height: mediaQueryData.size.height * 0.5,
                decoration: const BoxDecoration(color: Colors.white),
              ),
              _buildMusclesList(fitnessPlanMusclesViewModel.data!.where((element) => !element.isMain!).toList()),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox _buildMusclesList(List<MuscleModel> muscles) {
    return SizedBox(
      width: mediaQueryData.size.width * 0.4,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => SizedBox(height: 10.h),
          separatorBuilder: (context, index) {
            return MuscleWidget(muscleModel: muscles[index]);
          },
          itemCount: muscles.length),
    );
  }
}
