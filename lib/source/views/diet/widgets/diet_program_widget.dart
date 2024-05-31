import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/app_export.dart';
import '../../../../utils/transitions/fade_transition.dart';
import '../../../providers/theme/theme_provider.dart';
import '../views/diet_plans_screen.dart';

class DietProgramWidget extends ConsumerWidget {
  const DietProgramWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeHelper = ref.watch(themeNotifierProvider);
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
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage80x80,
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
                            '5 Days',
                            style: TextStyle(
                              fontSize: 20.fSize,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '30 Recipes',
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
                              color: themeHelper.themeColor().blueGray80004,
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
        ),
      ],
    );
  }
}
