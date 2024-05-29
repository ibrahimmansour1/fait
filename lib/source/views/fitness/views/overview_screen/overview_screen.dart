import 'dart:async';
import 'package:fait/source/routes.dart';
import 'package:fait/source/views/fitness/views/my_activity_screen.dart';
import 'package:fait/source/views/fitness/widgets/overview_percentages_widget.dart';
import 'package:fait/source/views/fitness/widgets/program_card_info.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

import '../../../../../utils/transitions/fade_transition.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  double _arrowPosition = 0.5;
  bool _arrowUp = true;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _arrowUp = !_arrowUp;
        _arrowPosition = _arrowUp ? 0.0 : 10.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    height: 596.v,
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgBodyBalance,
                          height: 596.v,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          onTap: () {
                            onTapImgArrowLeft(context);
                          },
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  appTheme
                                      .gray500111, // Adjust opacity as needed
                                  appTheme.white
                                      .withOpacity(0.1), // Fully transparent
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 36.v,
                    left: 20.h,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgArrowLeft,
                      height: 24.v,
                      width: 16.h,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 16.h),
                      onTap: () {
                        onTapImgArrowLeft(context);
                      },
                    ),
                  ),
                  const ProgramCardInfo(),
                  Positioned(
                    bottom: 30.v,
                    left: 0.h,
                    right: 0.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                      ),
                      child: Column(
                        children: [
                          const OverviewPercentagesWidget(
                            cardioText: "Cardio",
                            cardioPercentageText: "18 %",
                            strengthText: "Strength",
                            strengthPercentageText: "53 %",
                            stretchText: "Stretch",
                            stretchPercentageText: "35 %",
                            cardioPercentageIndicator: 18,
                            strengthPercentageIndicator: 53,
                            stretchPercentageIndicator: 35,
                          ),
                          SizedBox(height: 70.v),
                          GestureDetector(
                            onPanStart: (_) {
                              Navigator.pushNamed(
                                  context, AppRoutes.myActivityScreen);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                  transform: Matrix4.translationValues(
                                    0,
                                    _arrowPosition,
                                    0,
                                  ),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgArrowProgram,
                                    height: 28.v,
                                    width: 20.h,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(left: 16.h),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.v),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
