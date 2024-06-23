import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/providers/diet/diet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/app_export.dart';
import '../../../../utils/transitions/fade_transition.dart';
import '../views/diet_plans_screen.dart';

class DietProgramWidget extends ConsumerStatefulWidget {
  const DietProgramWidget({
    super.key,
  });

  @override
  ConsumerState<DietProgramWidget> createState() => _DietProgramWidgetState();
}

class _DietProgramWidgetState extends ConsumerState<DietProgramWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(dietsProvider).getDiets();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dietViewModel = ref.watch(dietsProvider).dietResponses;
    return SingleChildScrollView(
      child: Column(
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
          dietViewModel.status != Status.completed
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: dietViewModel.data!.isEmpty
                      ? 1
                      : dietViewModel.data!.length,
                  itemBuilder: (context, index) {
                    return DietProgramCardWidget(
                        imagePath: dietViewModel.data![index].image,
                        numberOfDays:
                            dietViewModel.data![index].numberOfDays.toString(),
                        numberOfRecipes: dietViewModel
                            .data![index].numberOfRecipes
                            .toString());
                  })
        ],
      ),
    );
  }
}

class DietProgramCardWidget extends StatelessWidget {
  final String? imagePath;
  final String numberOfDays;
  final String numberOfRecipes;

  const DietProgramCardWidget({
    super.key,
    this.imagePath,
    required this.numberOfDays,
    required this.numberOfRecipes,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              CustomImageView(
                imagePath: imagePath!.isEmpty
                    ? ImageConstant.imgImage80x80
                    : imagePath ?? ImageConstant.imgImage80x80,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * .95,
                height: MediaQuery.of(context).size.height * .33,
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        appTheme.gray500111
                            .withOpacity(0.4), // Adjust opacity as needed
                        appTheme.white.withOpacity(0.01), // Fully transparent
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
                        numberOfDays.isEmpty ? '5 Days' : numberOfDays,
                        style: TextStyle(
                          fontSize: 20.fSize,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        numberOfRecipes.isEmpty
                            ? '30 Recipes'
                            : numberOfRecipes,
                        style: TextStyle(
                          fontSize: 18.fSize,
                          color: Colors.white.withOpacity(0.75),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 160.h),
                  SizedBox(height: 60.h),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       FadePageRouteBuilder(
                  //         page: const WorkoutGroupScreen(),
                  //         duration: const Duration(milliseconds: 800),
                  //       ),
                  //     );
                  //   },
                  //   child: const CircleAvatar(
                  //     backgroundColor: Colors.white,
                  //     child: Icon(
                  //       Icons.menu_rounded,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // )
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
                          page:
                              DietPlansScreen(), // TODO: Navigate to recipes overView screen
                          duration: const Duration(milliseconds: 800),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff17D1E0),
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
    );
  }
}
