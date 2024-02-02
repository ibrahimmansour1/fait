import 'package:fait/source/localization/app_localization.dart';
import 'package:fait/source/views/home/widgets/add_new_goal_bottom_sheet.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../widgets/app_bar/custom_app_bar.dart';
import '../../../../widgets/custom_icon_button.dart';
import '../../widgets/goalscards_item_widget.dart';

part '../../widgets/my_avatar_section_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 15.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 32.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgProfile,
                                      height: 64.adaptSize,
                                      width: 64.adaptSize,
                                      margin: EdgeInsets.only(bottom: 21.v)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 24.h),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("lbl_zahra_a".tr,
                                                style: CustomTextStyles
                                                    .titleMediumOnPrimaryContainerSemiBold18),
                                            SizedBox(height: 13.v),
                                            Text("msg_last_sync_jan_4".tr,
                                                style: CustomTextStyles
                                                    .titleMediumOnPrimaryContainerSemiBold18),
                                            SizedBox(height: 7.v),
                                            Text("lbl_battery_87".tr,
                                                style: CustomTextStyles
                                                    .titleMediumOnPrimaryContainerSemiBold18)
                                          ]))
                                ])),
                        SizedBox(height: 17.v),
                        _buildThirtySeven(context),
                        SizedBox(height: 24.v),
                        _buildGoalsAdd(context),
                        SizedBox(height: 11.v),
                        Padding(
                            padding: EdgeInsets.only(left: 32.h),
                            child: Text("msg_3_achieved_and_7".tr,
                                style: CustomTextStyles
                                    .bodyLargeOnPrimaryContainer18)),
                        SizedBox(height: 13.v),
                        _buildGoalsCards(context),
                        SizedBox(height: 16.v),
                        const _MyAvatarSectionWidget(),
                      ])),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 72.v,
        leadingWidth: double.maxFinite,
        leading: Container(
            height: 25.v,
            width: 16.h,
            margin: EdgeInsets.fromLTRB(32.h, 15.v, 380.h, 15.v),
            child: Stack(alignment: Alignment.topCenter, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 25.v,
                  width: 16.h,
                  alignment: Alignment.center,
                  onTap: () {
                    onTapImgArrowLeft(context);
                  }),
            ])));
  }

  /// Section Widget
  Widget _buildThirtySeven(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 32.h),
      child: SizedBox(
        height: 98.h,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 8.v),
                child: CustomIconButton(
                    height: 64.adaptSize,
                    width: 64.adaptSize,
                    padding: EdgeInsets.all(16.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgReachGoal,
                      width: 32.adaptSize,
                      height: 32.adaptSize,
                    ))),
            separatorBuilder: (context, index) => SizedBox(
                  width: 32.h,
                ),
            itemCount: 7),
      ),
    );
  }

  /// Section Widget
  Widget _buildGoalsAdd(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.only(left: 32.h, right: 27.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 1.v, bottom: 3.v),
                      child: Text("lbl_my_goals".tr,
                          style: CustomTextStyles.headlineSmallRobotoSemiBold)),
                  CustomImageView(
                      imagePath: ImageConstant.imgFloatingIcon,
                      height: 33.adaptSize,
                      width: 33.adaptSize,
                      onTap: () {
                        onTapImgFloatingIcon(context);
                      })
                ])));
  }

  /// Section Widget
  Widget _buildGoalsCards(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 160.v,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 32.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16.h);
                },
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const GoalscardsItemWidget();
                })));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft1(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the caloriesDetectGoalsScreen when the action is triggered.
  onTapImgFloatingIcon(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddNewGoalBottomSheet()),
      isScrollControlled: true,
      useRootNavigator: true,
    );
  }
}
