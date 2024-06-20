import 'dart:async';
import 'package:fait/source/views/fitness/widgets/overview_percentages_widget.dart';
import 'package:fait/source/views/fitness/widgets/program_card_info.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DietInfoScreen extends StatefulWidget {
  const DietInfoScreen({Key? key}) : super(key: key);

  @override
  State<DietInfoScreen> createState() => _DietInfoScreenState();
}

class _DietInfoScreenState extends State<DietInfoScreen> {
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
                          imagePath: ImageConstant.imgImage80x80,
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
                  Positioned(
                    bottom: 0.v,
                    left: 0.h,
                    right: 0.h,
                    child: Container(
                      width: 358.h,
                      height: 428.v,
                      padding: EdgeInsets.symmetric(horizontal: 32.h),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.h)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 30.v),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15.h),
                                  child: Text(
                                    "Yogurt with fruits",
                                    style: CustomTextStyles
                                        .headlineSmallRobotoSemiBold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 17.v),
                            Wrap(
                              children: [
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Leo, eget nunc, in nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Leo, eget nunc, in nisl.",
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainer18,
                                ),
                              ],
                            ),
                            SizedBox(height: 50.v),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusStyle.roundedBorder8,
                                color: appTheme.blueGray80004,
                              ),
                              width: 500.h,
                              // height: 50.v,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0.adaptSize),
                                    child: Text(
                                      "Your calories needed today",
                                      style: CustomTextStyles
                                          .headlineSmallRobotoOnPrimaryContainerRegular,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.v,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.v),
                                    child: Text(
                                      "1500 Kcal",
                                      style: CustomTextStyles
                                          .headlineSmallRobotoOnPrimaryContainerSemiBold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.v,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
