import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/providers/exercise/wrong_step_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:o3d/o3d.dart';

import '../../../../../utils/app_export.dart';

class WrongExercisesStepScreen extends ConsumerStatefulWidget {
  const WrongExercisesStepScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WrongExercisesStepScreen> createState() =>
      _WrongExercisesStepScreenState();
}

class _WrongExercisesStepScreenState
    extends ConsumerState<WrongExercisesStepScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(wrongStepProvider).getWrongStepData(id: 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wrongStepViewModel = ref.watch(wrongStepProvider).wrongStepResponse;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildTopBar(context),
                ),
                const SizedBox(height: 20),
                // wrongStepViewModel.status != Status.completed
                false
                    ? Container(
                        margin: EdgeInsets.only(top: SizeUtils.height * 0.35),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          // _buildStepsText(wrongStepViewModel.data!.text),
                          _buildStepsText(null),
                          const SizedBox(height: 20),
                          // The 3D viewer widget
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: SizeUtils.width - 40,
                              height: SizeUtils.height * 0.7,
                              // child: wrongStepViewModel.data!.model3DUrl !=
                              //             null &&
                              //         wrongStepViewModel.data!.model3DUrl != ""
                              child: 
                                   const O3D.network(
                                      // src: wrongStepViewModel.data!.model3DUrl!,
                                      src:
                                          'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                                      // Add additional O3D properties as needed
                                    )
                                  //  const O3D.asset(
                                  //     src: "assets/output.glb",
                                  //     // Add additional O3D properties as needed
                                  //   ),
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildStepsText(String? stepText) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.primary, width: 1),
        ),
      ),
      child: Text(
        "Step: ${stepText ?? "You are doing something wrong!"}",
        style: theme.textTheme.bodyLarge!.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
          fontSize: 17,
        ),
      ),
    );
  }

  Stack _buildTopBar(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              "Wrong Step",
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
