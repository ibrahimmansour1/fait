import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class ExerciseInfoScreen extends StatelessWidget {
  bool tryIt;
  ExerciseInfoScreen({super.key, this.tryIt = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder22
              .copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero)),
      child: Column(children: [
        _buildExerciseAnimationCard(context),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 32.h),
            child: ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: 30.v,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("JUMPING JACKS 20s",
                          style: CustomTextStyles.headlineSmallRoboto_2)),
                  SizedBox(height: 46.v),
                  _buildExerciseInfoItemsSection(context),
                  SizedBox(height: 46.v),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 32.h),
                    child: Text(
                      "Focus Area",
                      style: theme.textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.v),
                  _buildFocusArea(context),
                  SizedBox(height: 24.v),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 32.h),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgFocus1,
                              height: 352.v,
                              width: 152.h),
                          CustomImageView(
                              imagePath: ImageConstant.imgFocus2,
                              height: 352.v,
                              width: 152.h,
                              margin: EdgeInsetsDirectional.only(start: 8.h))
                        ]),
                  ),
                  SizedBox(height: 23.v),
                  _buildButtons(context),
                  SizedBox(height: 23.v)
                ]),
          ),
        )
      ]),
    );
  }

  /// Section Widget
  Widget _buildExerciseAnimationCard(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.fromLTRB(32.h, 32.v, 32.h, 30.v),
        decoration: AppDecoration.fillBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
            border: Border(
                bottom:
                    BorderSide(color: theme.colorScheme.primary, width: 1))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 24.v,
              width: 16.h,
              margin: EdgeInsets.only(bottom: 232.v),
              onTap: () {
                onTapImgArrowLeft(context);
              }),
          CustomImageView(
              imagePath: ImageConstant.imgExerciseAnimation,
              height: 241.v,
              width: 112.h,
              margin: EdgeInsets.only(left: 110.h, top: 7.v, bottom: 8.v))
        ]));
  }

  /// Section Widget
  Widget _buildExerciseInfoItemsSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: Row(
          children: [
            _buildExerciseInfoItem("Type", "Streching"),
            SizedBox(width: 25.h),
            _buildExerciseInfoItem("Mechanics", "N/A"),
            SizedBox(width: 25.h),
            _buildExerciseInfoItem("Equipments", "body only"),
            SizedBox(width: 25.h),
            _buildExerciseInfoItem("Difficulty", "Beginner"),
            SizedBox(width: 25.h),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFocusArea(BuildContext context) {
    return Wrap(runSpacing: 16.v, spacing: 16.h, children: [
      _buildItemInfo("Shoulders",
          isFocusArea: true, color: appTheme.blueA40001),
      _buildItemInfo("Quadriceps",
          isFocusArea: true, color: appTheme.blueA40001),
      _buildItemInfo("Adductors",
          isFocusArea: true, color: appTheme.blueA40001),
      _buildItemInfo("Glutes",
          isFocusArea: true, color: appTheme.blueGray90001),
      _buildItemInfo("Calves",
          isFocusArea: true, color: appTheme.blueGray90001),
      _buildItemInfo("Chest", isFocusArea: true, color: appTheme.blue50),
    ]);
  }

  /// Section Widget
  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 32.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomElevatedButton(
            onPressed: () {
              getPermissionStatus(context, Permission.microphone, "Microphone")
                  .then((microphonePermission) {
                getPermissionStatus(
                        context, Permission.camera, "Camera")
                    .then((cameraPermission) {
                  if (microphonePermission && cameraPermission) {
                    Navigator.pushNamed(context, '/open_camera_screen');
                  }
                });
              });
            },
            height: 48.v,
            width: 170.h,
            text: tryIt ? "Try it" : "Start",
            buttonStyle: CustomButtonStyles.fillPrimaryTL24,
            buttonTextStyle: CustomTextStyles.titleMedium18),
        CustomOutlinedButton(
            onPressed: () => onTapImgArrowLeft(context),
            text: "Close",
            width: 170.h,
            buttonStyle: CustomButtonStyles.outlineGray,
            buttonTextStyle: CustomTextStyles.titleMediumGray90003)
      ]),
    );
  }

  // Shared Widgets
  _buildExerciseInfoItem(String name, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            fontSize: 20.fSize,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 5.v,
        ),
        _buildItemInfo(value)
      ],
    );
  }

  _buildItemInfo(String value, {bool isFocusArea = false, Color? color}) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadiusStyle.circleBorder16,
      child: Container(
        decoration: AppDecoration.fillBluegray80004
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder16),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.v, horizontal: 10.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isFocusArea)
                Container(
                  decoration: AppDecoration.fillBluegray90002.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder64,
                      color: color),
                  height: 10.adaptSize,
                  width: 10.adaptSize,
                  margin: EdgeInsets.only(right: 8.h),
                ),
              Text(
                value,
                style: TextStyle(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
