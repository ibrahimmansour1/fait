import 'dart:developer';

import 'package:fait/source/localization/app_localization.dart';
import 'package:fait/source/views/home/widgets/kcal1_item_widget.dart';
import 'package:fait/source/views/home/widgets/kcal_item_widget.dart';
import 'package:fait/source/views/home/widgets/weekcardssetdefault_item_widget.dart';
import 'package:fait/source/widgets/app_bar/appbar_leading_image.dart';
import 'package:fait/source/widgets/app_bar/appbar_title.dart';
import 'package:fait/source/widgets/app_bar/appbar_title_circleimage.dart';
import 'package:fait/source/widgets/app_bar/custom_app_bar.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 33.v),
            child: Padding(
              padding: EdgeInsets.only(left: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                      opacity: 0.6,
                      child: Text("msg_sat_nov_1_2023".tr,
                          style:
                              CustomTextStyles.bodyLargeOnPrimaryContainer_1)),
                  SizedBox(height: 21.v),
                  Text("lbl_daily_activity".tr,
                      style: CustomTextStyles.headlineSmallRoboto_2),
                  SizedBox(height: 34.v),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 5.h),
                    child: _buildWeekCardsSetDefault(context),
                  ),
                  SizedBox(height: 33.v),
                  Text("msg_total_body_status".tr,
                      style: CustomTextStyles.headlineSmallRoboto_2),
                  SizedBox(height: 29.v),
                  Padding(
                      padding: EdgeInsets.only(right: 55.h),
                      child: Row(children: [
                        GestureDetector(
                            onTap: () {
                              onTapContnet(context);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 28.h, vertical: 10.v),
                                decoration: AppDecoration.fillBluegray80004
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_sleep".tr,
                                          style: CustomTextStyles.bodyLarge17),
                                      SizedBox(height: 17.v),
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgSleepchart,
                                          height: 59.v,
                                          width: 106.h),
                                      SizedBox(height: 19.v),
                                      RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "lbl_8".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumOnPrimaryContainer),
                                            TextSpan(
                                                text: "lbl_h".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumBluegray40001_1),
                                            TextSpan(
                                                text: "lbl_23m".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumOnPrimaryContainer)
                                          ]),
                                          textAlign: TextAlign.left),
                                      SizedBox(height: 10.v),
                                      Text("lbl_last_updated_3d".tr,
                                          style: CustomTextStyles
                                              .bodyMediumBluegray40001_2
                                              .copyWith(fontSize: 15.fSize))
                                    ]))),
                        Padding(
                            padding: EdgeInsets.only(left: 14.h, bottom: 2.v),
                            child: Column(children: [
                              Container(
                                  width: 162.h,
                                  padding: EdgeInsets.symmetric(vertical: 10.v),
                                  decoration: AppDecoration.fillBluegray80004
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder12),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(top: 2.v),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("lbl_450".tr,
                                                      style: theme.textTheme
                                                          .titleLarge),
                                                  SizedBox(height: 12.v),
                                                  Text("lbl_steps".tr,
                                                      style: CustomTextStyles
                                                          .bodyLargeOnPrimaryContainer17)
                                                ])),
                                        CustomImageView(
                                            imagePath: ImageConstant.imgSteps,
                                            height: 52.v,
                                            width: 38.h,
                                            margin: EdgeInsets.only(
                                                top: 4.v, bottom: 3.v))
                                      ])),
                              SizedBox(height: 15.v),
                              Container(
                                  width: 162.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.h, vertical: 12.v),
                                  decoration: AppDecoration.fillBluegray80004
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder12),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("lbl_325".tr,
                                                  style: theme
                                                      .textTheme.titleLarge),
                                              SizedBox(height: 10.v),
                                              Text("lbl_calories".tr,
                                                  style: CustomTextStyles
                                                      .bodyLargeOnPrimaryContainer17)
                                            ]),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.v, bottom: 9.v),
                                            child: SizedBox(
                                                height: 39.v,
                                                width: 39.h,
                                                child:
                                                    CircularProgressIndicator(
                                                        value: 0.75,
                                                        color: theme.colorScheme
                                                            .primary,
                                                        strokeWidth: 4.h)))
                                      ]))
                            ]))
                      ])),
                  SizedBox(height: 32.v),
                  _buildWaterCard(context),
                  SizedBox(height: 33.v),
                  Text("lbl_my_day".tr,
                      style: CustomTextStyles.headlineSmallRoboto_2),
                  SizedBox(height: 29.v),
                  _buildAllMyDayCard(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 82.v,
        leadingWidth: 68.h,
        leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgMenuIcon,
          margin: EdgeInsets.only(left: 32.h, top: 29.v, bottom: 29.v),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppbarTitleCircleimage(
              imagePath: ImageConstant.imgFait32x32,
              // margin: EdgeInsets.only(left: 98.h, top: 41.v, bottom: 9.v),
            ),
            SizedBox(
              width: 8.h,
            ),
            AppbarTitle(
              text: "lbl_fait".tr,
              // margin: EdgeInsets.fromLTRB(8.h, 44.v, 166.h, 13.v),
            )
          ],
        ),
        centerTitle: true,
        // actions: [
        //   AppbarTitle(
        //     text: "lbl_fait".tr,
        //     // margin: EdgeInsets.fromLTRB(8.h, 44.v, 166.h, 13.v),
        //   )
        // ],
        styleType: Style.bgOutline);
  }

  /// Section Widget
  Widget _buildWeekCardsSetDefault(BuildContext context) {
    final DateTime now = DateTime.now();
    final List<String> weekDaysNames =
        DateFormat.EEEE(AppLocalization.of().locale.toString())
            .dateSymbols
            .STANDALONEWEEKDAYS;
    final selectedDayProvider = StateProvider<int>((ref) {
      return 0;
    });
    return SizedBox(
        height: 90.v,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 32.h);
            },
            itemCount: 7,
            itemBuilder: (context, index) {
              DateTime theDay = now.subtract(Duration(days: index));
              int weekDayIndex = theDay.weekday == 7 ? 0 : theDay.weekday;
              return Consumer(
                builder: (context, ref, child) => WeekcardssetdefaultItemWidget(
                  number: theDay.day,
                  title: weekDaysNames[weekDayIndex].substring(0, 3),
                  selected: index == ref.watch(selectedDayProvider),
                  onTap: () {
                    ref
                        .watch(selectedDayProvider.notifier)
                        .update((state) => index);
                  },
                ),
              );
            }));
  }

  /// Section Widget
  Widget _buildWaterCard(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapWaterCard(context);
        },
        child: Container(
            margin: EdgeInsets.only(right: 51.h),
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillBluegray80004
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Padding(
                          padding:
                              EdgeInsets.only(left: 7.h, top: 6.v, bottom: 2.v),
                          child: Column(children: [
                            RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "lbl_today_you_took".tr,
                                      style: CustomTextStyles
                                          .titleMediumOnPrimaryContainerSemiBold18_1),
                                  TextSpan(
                                      text: "lbl_750_ml".tr,
                                      style: CustomTextStyles
                                          .titleMediumDeeppurple300SemiBold),
                                  TextSpan(
                                      text: "lbl_of_water".tr,
                                      style: CustomTextStyles
                                          .titleMediumOnPrimaryContainerSemiBold18_1)
                                ]),
                                textAlign: TextAlign.left),
                            SizedBox(height: 7.v),
                            CustomImageView(
                                imagePath: ImageConstant.imgAddOrMinusCup,
                                height: 42.v,
                                width: 117.h,
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 60.h))
                          ]))),
                  Container(
                      height: 13.adaptSize,
                      width: 13.adaptSize,
                      margin: EdgeInsets.only(left: 40.h, top: 70.v),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 13.adaptSize,
                      ))
                ])));
  }

  /// Section Widget
  Widget _buildAllMyDayCard(BuildContext context) {
    String type = "running";
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (context, index) {
        if (index == 0) {
          type = "running";
        } else if (index % 2 == 0) {
          type = "exercise";
        } else {
          type = "meal";
        }
        return Padding(
            padding: EdgeInsets.only(right: 20.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CustomImageView(
                        imagePath: type == "running"
                            ? ImageConstant.imgRunningFemale
                            : type == "meal"
                                ? ImageConstant.nutrition
                                : ImageConstant.exercising,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                  ),
                  SizedBox(
                    height: 3.v,
                  ),
                  Container(
                    color: Colors.white,
                    width: 2,
                    height: type == "meal" ? 100.v * 3 : 105.v,
                  )
                ],
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(left: 24.h, bottom: 15.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 1.v),
                                  child: Text(
                                      type == "running"
                                          ? "lbl_running".tr
                                          : type == "meal"
                                              ? "lbl_breakfast".tr
                                              : "lbl_exercising".tr,
                                      style: CustomTextStyles
                                          .titleMediumOnPrimaryContainerSemiBold_1)),
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgVectorOnprimarycontainer,
                                  height: 16.adaptSize,
                                  width: 16.adaptSize,
                                  margin:
                                      EdgeInsets.only(left: 14.h, bottom: 4.v))
                            ]),
                            SizedBox(height: 6.v),
                            _buildTimePart(context,
                                time: "msg_07_00_am_07_45".tr),
                            SizedBox(height: 8.v),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8.v),
                              decoration: AppDecoration.fillBluegray80004
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder22),
                              child: type == "running"
                                  ? _buildRunningInfoWidget()
                                  : type == "meal"
                                      ? _buildMealInfoWidget()
                                      : _buildExerciseInfoWidget(context,
                                          sideLegSwing: "lbl_side_leg_swing".tr,
                                          hipAbductors: "lbl_hip_abductors".tr,
                                          time: "lbl_5_00".tr,
                                          kcalCounter: "lbl_8_4_kcal".tr),
                            )
                          ])))
            ]));
      },
    );
  }

  Widget _buildRunningInfoWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 2.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgLocation,
                  height: 20.v,
                  width: 14.h),
              SizedBox(height: 5.v),
              Text("lbl_8_32".tr,
                  style:
                      CustomTextStyles.titleMediumOnPrimaryContainerSemiBold_1),
              SizedBox(height: 6.v),
              Text("lbl_kilometers".tr, style: theme.textTheme.bodyMedium)
            ])),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 2.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  decoration: AppDecoration.fillOnPrimaryContainer
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgClockGreen400,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      radius: BorderRadius.circular(10.h),
                      alignment: Alignment.center)),
              SizedBox(height: 5.v),
              Text("lbl_45".tr,
                  style:
                      CustomTextStyles.titleMediumOnPrimaryContainerSemiBold_1),
              SizedBox(height: 6.v),
              Align(
                  alignment: Alignment.center,
                  child: Text("lbl_min".tr, style: theme.textTheme.bodyMedium))
            ])),
        Padding(
            padding: EdgeInsets.only(right: 21.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgVectorOrangeA200,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              SizedBox(height: 5.v),
              Text("lbl_5_25".tr,
                  style:
                      CustomTextStyles.titleMediumOnPrimaryContainerSemiBold_1),
              SizedBox(height: 6.v),
              Text("lbl_speed".tr, style: theme.textTheme.bodyMedium)
            ]))
      ]),
    );
  }

  /// Section Widget
  Widget _buildExercingCardMy1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20.h),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgSidebarCardOnprimarycontainer156x40,
              height: 156.v,
              width: 40.h),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 24.h, top: 13.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDeitDoneIcon(context,
                            exercising: "lbl_exercising".tr),
                        SizedBox(height: 8.v),
                        _buildTimePart(context, time: "msg_10_00_am_10_30".tr),
                        SizedBox(height: 8.v),
                        _buildExerciseInfoWidget(context,
                            sideLegSwing: "lbl_side_leg_swing".tr,
                            hipAbductors: "lbl_hip_abductors".tr,
                            time: "lbl_5_00".tr,
                            kcalCounter: "lbl_8_4_kcal".tr)
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildLunch(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20.h),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgSidebarCardOnprimarycontainer,
              height: 319.v,
              width: 40.h),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 24.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text("lbl_lunch".tr,
                              style: CustomTextStyles
                                  .titleMediumOnPrimaryContainerSemiBold_1),
                          CustomImageView(
                              imagePath:
                                  ImageConstant.imgVectorOnprimarycontainer,
                              height: 16.adaptSize,
                              width: 16.adaptSize,
                              margin: EdgeInsets.only(left: 8.h))
                        ]),
                        SizedBox(height: 8.v),
                        Row(children: [
                          Container(
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              decoration: AppDecoration.fillOnPrimaryContainer
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgClock,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  radius: BorderRadius.circular(10.h),
                                  alignment: Alignment.center)),
                          Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Text("msg_12_00_pm_12_30".tr,
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainerSemiBold_1))
                        ]),
                        SizedBox(height: 8.v),
                        _buildMealInfoWidget()
                      ])))
        ]));
  }

  ListView _buildMealInfoWidget() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 1.v);
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return const KcalItemWidget();
        });
  }

  /// Section Widget
  Widget _buildLunch1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20.h),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgSidebarCardOnprimarycontainer,
              height: 319.v,
              width: 40.h),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 24.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text("lbl_dinner".tr,
                              style: CustomTextStyles
                                  .titleMediumOnPrimaryContainerSemiBold_1),
                          CustomImageView(
                              imagePath:
                                  ImageConstant.imgVectorOnprimarycontainer,
                              height: 16.adaptSize,
                              width: 16.adaptSize,
                              margin: EdgeInsets.only(left: 8.h))
                        ]),
                        SizedBox(height: 8.v),
                        Row(children: [
                          Container(
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              decoration: AppDecoration.fillOnPrimaryContainer
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgClock,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  radius: BorderRadius.circular(10.h),
                                  alignment: Alignment.center)),
                          Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Text("msg_6_00_pm_6_30_pm".tr,
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainerSemiBold_1))
                        ]),
                        SizedBox(height: 8.v),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return const Kcal1ItemWidget();
                            })
                      ])))
        ]));
  }

  /// Common widget
  Widget _buildTimePart(
    BuildContext context, {
    required String time,
  }) {
    return Row(children: [
      Container(
          height: 20.adaptSize,
          width: 20.adaptSize,
          decoration: AppDecoration.fillOnPrimaryContainer
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: CustomImageView(
              imagePath: ImageConstant.imgClock,
              height: 20.adaptSize,
              width: 20.adaptSize,
              radius: BorderRadius.circular(10.h),
              alignment: Alignment.center)),
      Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Text(time,
              style: CustomTextStyles.titleMediumOnPrimaryContainerSemiBold_1
                  .copyWith(
                      color:
                          theme.colorScheme.onPrimaryContainer.withOpacity(1))))
    ]);
  }

  /// Common widget
  Widget _buildNinetyFour(
    BuildContext context, {
    required String sixThousandThreeHundredSevente,
    required String zero,
    required String oneThousandEightHundredNinetyF,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: ImageConstant.imgCalories,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(top: 1.v, bottom: 3.v)),
      Padding(
          padding: EdgeInsets.only(left: 4.h, top: 1.v, bottom: 3.v),
          child: Text(sixThousandThreeHundredSevente,
              style: theme.textTheme.labelLarge!
                  .copyWith(color: theme.colorScheme.onPrimaryContainer))),
      CustomImageView(
          imagePath: ImageConstant.imgSettings,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(left: 10.h, top: 1.v, bottom: 3.v)),
      Padding(
          padding: EdgeInsets.only(left: 4.h, top: 1.v, bottom: 3.v),
          child: Text(zero,
              style: theme.textTheme.labelLarge!
                  .copyWith(color: theme.colorScheme.onPrimaryContainer))),
      CustomImageView(
          imagePath: ImageConstant.imgProtiens,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(left: 27.h, top: 1.v, bottom: 3.v)),
      Padding(
          padding: EdgeInsets.only(left: 4.h, top: 1.v, bottom: 3.v),
          child: Text(oneThousandEightHundredNinetyF,
              style: theme.textTheme.labelLarge!
                  .copyWith(color: theme.colorScheme.onPrimaryContainer))),
      Container(
          height: 20.adaptSize,
          width: 20.adaptSize,
          margin: EdgeInsets.only(left: 17.h),
          decoration: AppDecoration.fillOnPrimaryContainer
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: CustomImageView(
              imagePath: ImageConstant.imgChangeIcon,
              height: 20.adaptSize,
              width: 20.adaptSize,
              radius: BorderRadius.circular(10.h),
              alignment: Alignment.center))
    ]);
  }

  /// Common widget
  Widget _buildDeitDoneIcon(
    BuildContext context, {
    required String exercising,
  }) {
    return Row(children: [
      Text(exercising,
          style: CustomTextStyles.titleMediumOnPrimaryContainerSemiBold_1
              .copyWith(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(1))),
      CustomImageView(
          imagePath: ImageConstant.imgVectorOnprimarycontainer,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(left: 8.h))
    ]);
  }

  /// Common widget
  Widget _buildExerciseInfoWidget(
    BuildContext context, {
    required String sideLegSwing,
    required String hipAbductors,
    required String time,
    required String kcalCounter,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomImageView(
            imagePath: ImageConstant.imgCardImage,
            height: 64.adaptSize,
            width: 64.adaptSize,
            radius: BorderRadius.circular(8.h),
            margin: EdgeInsets.only(left: 4.h, top: 8.v, bottom: 8.v)),
        Padding(
            padding: EdgeInsets.only(top: 2.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(sideLegSwing,
                                  style: CustomTextStyles
                                      .titleMediumOnPrimaryContainerSemiBold_1
                                      .copyWith(
                                          color: theme
                                              .colorScheme.onPrimaryContainer
                                              .withOpacity(1))),
                              SizedBox(height: 12.v),
                              Text(hipAbductors,
                                  style: CustomTextStyles.bodyMediumPrimary
                                      .copyWith(
                                          color: theme.colorScheme.primary
                                              .withOpacity(0.5)))
                            ]),
                        CustomImageView(
                            imagePath: ImageConstant.imgChangeIcon,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                            margin: EdgeInsets.only(
                                left: 22.h, top: 3.v, bottom: 28.v)),
                        Container(
                            height: 15.adaptSize,
                            width: 15.adaptSize,
                            margin: EdgeInsets.only(
                                left: 13.h, top: 4.v, bottom: 28.v),
                            decoration: AppDecoration.fillOnPrimaryContainer
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder8),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgInfo,
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                                radius: BorderRadius.circular(7.h),
                                alignment: Alignment.center))
                      ])),
              SizedBox(height: 12.v),
              Row(children: [
                Container(
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 1.v),
                    decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder8),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgClockGreen400,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        radius: BorderRadius.circular(8.h),
                        alignment: Alignment.center)),
                Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text(time,
                        style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1)))),
                CustomImageView(
                    imagePath: ImageConstant.imgCalories16x16,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(left: 8.h, top: 1.v, bottom: 1.v)),
                Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Text(kcalCounter,
                        style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1))))
              ])
            ]))
      ]),
    );
  }

  /// Common widget
  Widget _buildExercingCardMy(
    BuildContext context, {
    required String exercising,
    required String time,
    required String sideLegSwing,
    required String hipAbductors,
    required String time1,
    required String kcalCounter,
  }) {
    return Row(children: [
      CustomImageView(
          imagePath: ImageConstant.imgSidebarCardOnprimarycontainer156x40,
          height: 156.v,
          width: 40.h),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 24.h, top: 13.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(exercising,
                          style: CustomTextStyles
                              .titleMediumOnPrimaryContainerSemiBold_1
                              .copyWith(
                                  color: theme.colorScheme.onPrimaryContainer
                                      .withOpacity(1))),
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorOnprimarycontainer,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                          margin: EdgeInsets.only(left: 8.h))
                    ]),
                    SizedBox(height: 8.v),
                    Row(children: [
                      Container(
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          decoration: AppDecoration.fillOnPrimaryContainer
                              .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgClock,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              radius: BorderRadius.circular(10.h),
                              alignment: Alignment.center)),
                      Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(time,
                              style: CustomTextStyles
                                  .titleMediumOnPrimaryContainerSemiBold_1
                                  .copyWith(
                                      color: theme
                                          .colorScheme.onPrimaryContainer
                                          .withOpacity(1))))
                    ]),
                    SizedBox(height: 8.v),
                    Container(
                        padding: EdgeInsets.fromLTRB(20.h, 4.v, 20.h, 3.v),
                        decoration: AppDecoration.outlineBlack,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgCardImage,
                                  height: 64.adaptSize,
                                  width: 64.adaptSize,
                                  radius: BorderRadius.circular(8.h),
                                  margin: EdgeInsets.only(
                                      left: 4.h, top: 8.v, bottom: 8.v)),
                              Padding(
                                  padding: EdgeInsets.only(top: 2.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 1.h),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(sideLegSwing,
                                                            style: CustomTextStyles
                                                                .titleMediumOnPrimaryContainerSemiBold_1
                                                                .copyWith(
                                                                    color: theme
                                                                        .colorScheme
                                                                        .onPrimaryContainer
                                                                        .withOpacity(
                                                                            1))),
                                                        SizedBox(height: 12.v),
                                                        Text(hipAbductors,
                                                            style: CustomTextStyles
                                                                .bodyMediumPrimary
                                                                .copyWith(
                                                                    color: theme
                                                                        .colorScheme
                                                                        .primary
                                                                        .withOpacity(
                                                                            0.5)))
                                                      ]),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgChangeIcon,
                                                      height: 16.adaptSize,
                                                      width: 16.adaptSize,
                                                      margin: EdgeInsets.only(
                                                          left: 22.h,
                                                          top: 3.v,
                                                          bottom: 28.v)),
                                                  Container(
                                                      height: 15.adaptSize,
                                                      width: 15.adaptSize,
                                                      margin: EdgeInsets.only(
                                                          left: 13.h,
                                                          top: 4.v,
                                                          bottom: 28.v),
                                                      decoration: AppDecoration
                                                          .fillOnPrimaryContainer
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder8),
                                                      child: CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgInfo,
                                                          height: 15.adaptSize,
                                                          width: 15.adaptSize,
                                                          radius: BorderRadius
                                                              .circular(7.h),
                                                          alignment:
                                                              Alignment.center))
                                                ])),
                                        SizedBox(height: 12.v),
                                        Row(children: [
                                          Container(
                                              height: 16.adaptSize,
                                              width: 16.adaptSize,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 1.v),
                                              decoration: AppDecoration
                                                  .fillOnPrimaryContainer
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder8),
                                              child: CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgClockGreen400,
                                                  height: 16.adaptSize,
                                                  width: 16.adaptSize,
                                                  radius: BorderRadius.circular(
                                                      8.h),
                                                  alignment: Alignment.center)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.h),
                                              child: Text(time1,
                                                  style: theme
                                                      .textTheme.bodyLarge!
                                                      .copyWith(
                                                          color: theme
                                                              .colorScheme
                                                              .onPrimaryContainer
                                                              .withOpacity(
                                                                  1)))),
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgCalories16x16,
                                              height: 16.adaptSize,
                                              width: 16.adaptSize,
                                              margin: EdgeInsets.only(
                                                  left: 8.h,
                                                  top: 1.v,
                                                  bottom: 1.v)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.h),
                                              child: Text(kcalCounter,
                                                  style: theme
                                                      .textTheme.bodyLarge!
                                                      .copyWith(
                                                          color: theme
                                                              .colorScheme
                                                              .onPrimaryContainer
                                                              .withOpacity(1))))
                                        ])
                                      ]))
                            ]))
                  ])))
    ]);
  }

  /// Navigates to the sleepTrackerScreen when the action is triggered.
  onTapContnet(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.sleepTrackerScreen);
  }

  /// Navigates to the waterIntakeScreen when the action is triggered.
  onTapWaterCard(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.waterIntakeScreen);
  }
}
