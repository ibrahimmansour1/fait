import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../utils/app_export.dart';
import '../../../localization/app_localization.dart';
import '../../../widgets/custom_icon_button.dart';
import '../widgets/dietcards_item_widget.dart';
import 'recipe_info_screen.dart';

// ignore_for_file: must_be_immutable
class DietPlansScreen extends StatelessWidget {
  DietPlansScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
          width: SizeUtils.width,
          child: SizedBox(
              height: SizeUtils.height,
              width: double.maxFinite,
              child: Stack(alignment: Alignment.topCenter, children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin: EdgeInsets.only(right: 1.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 26.h, vertical: 32.v),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusStyle.customBorderTL24,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        child: ListView(children: [
                          SizedBox(height: SizeUtils.height * .28),
                          _buildMealSection(
                            context,
                            'Breakfast',
                            mealNames: breakFastMealNames,
                            mealPictures: breakFastMealPictures,
                            mealCalories: breakFastMealCalories,
                            totalCalories: breakFastMealCalories.fold(
                                0,
                                (previousValue, element) =>
                                    previousValue! + element),
                          ),
                          SizedBox(height: 32.v),
                          _buildMealSection(
                            context,
                            'Lunch',
                            mealNames: lunchMealNames,
                            mealPictures: lunchMealPictures,
                            mealCalories: lunchMealCalories,
                            totalCalories: lunchMealCalories.fold(
                                0,
                                (previousValue, element) =>
                                    previousValue! + element),
                          ),
                          SizedBox(height: 32.v),
                          _buildMealSection(
                            context,
                            'Snack',
                            mealNames: snackMealNames,
                            mealPictures: snackMealPictures,
                            mealCalories: snackMealCalories,
                            totalCalories: snackMealCalories.fold(
                                0,
                                (previousValue, element) =>
                                    previousValue! + element),
                          ),
                          SizedBox(height: 32.v),
                          _buildMealSection(
                            context,
                            'Dinner',
                            mealNames: dinnerMealNames,
                            mealPictures: dinnerMealPictures,
                            mealCalories: dinnerMealCalories,
                            totalCalories: dinnerMealCalories.fold(
                                0,
                                (previousValue, element) =>
                                    previousValue! + element),
                          ),
                          SizedBox(height: 32.v)
                        ]))),
                _buildTopPart(context),
              ]))),
    ));
  }

  List<String> breakFastMealNames = [
    '2 fried eggs',
    '3/4 wheat bread',
    'cucumber '
  ];
  List<String> breakFastMealPictures = [
    "https://images.pexels.com/photos/5276991/pexels-photo-5276991.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
    "https://images.pexels.com/photos/1586947/pexels-photo-1586947.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/17975573/pexels-photo-17975573/free-photo-of-a-bunch-of-cucumbers.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];
  List<int> breakFastMealCalories = [180, 120, 16];
  List<String> lunchMealNames = [
    'A quarter grilled chicken',
    '7 tablespoons white rice',
    '3 tablespoons cooked spinach',
  ];
  List<String> lunchMealPictures = [
    "https://images.pexels.com/photos/106343/pexels-photo-106343.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://asassyspoon.com/wp-content/uploads/cuban-white-rice-1.jpg",
    "https://static01.nyt.com/images/2023/11/28/multimedia/PF-Sauteed-Spinach-zvkm/PF-Sauteed-Spinach-zvkm-articleLarge.jpg?width=1280&quality=75&auto=webp",
  ];
  List<int> lunchMealCalories = [230, 140, 9];

  List<String> snackMealNames = [
    'coffee with sugar',
  ];
  List<String> snackMealPictures = [
    "https://images.pexels.com/photos/2456429/pexels-photo-2456429.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];
  List<int> snackMealCalories = [16];

  List<String> dinnerMealNames = [
    'Low-fat yogurt',
    'banana',
  ];
  List<String> dinnerMealPictures = [
    "https://littlespoonfarm.com/wp-content/uploads/2023/01/homemade-raw-yogurt-in-a-bowl.jpg",
    "https://images.pexels.com/photos/20605001/pexels-photo-20605001/free-photo-of-a-banana-and-a-piece-of-fruit-on-a-green-cutting-board.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];
  List<int> dinnerMealCalories = [143, 163];

  /// Section Widget
  Widget _buildMealSection(BuildContext context, String mealName,
      {List<String>? mealNames,
      List<String>? mealPictures,
      List<int>? mealCalories,
      int? totalCalories}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 30.v),
        decoration: AppDecoration.fillBluegray80004.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
          color: theme.colorScheme.onPrimaryContainer,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 8.h),
                  child: _buildMealSectionTitlePart(
                    context,
                    lunch: mealName,
                    kcalKcal: "300",
                    mealCalories: mealCalories,
                    totalCalories: totalCalories,
                  )),
              SizedBox(height: 24.v),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => DietcardsItemWidget(
                  mealName: mealNames[index],
                  mealPicture: mealPictures?[index],
                  mealCalory: mealCalories?[index],
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        useRootNavigator: true,
                        isScrollControlled: true,
                        builder: (_) => const RecipeInfoScreen());
                  },
                ),
                separatorBuilder: (context, index) => SizedBox(height: 8.v),
                itemCount: mealNames!.length,
              ),
            ]));
  }

  /// Section Widget
  Widget _buildTopPart(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 32.v),
        decoration: AppDecoration.fillBluegray80004.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 13.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            onTapImgArrowLeft(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: theme.colorScheme.tertiary,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 102.h, top: 10.v),
                          child: Text("Diet plan",
                              style: theme.textTheme.headlineLarge!.copyWith(
                                color: theme.colorScheme.tertiary,
                              )))
                    ])),
            SizedBox(height: 29.v),
            _buildTopCalendar(context),
          ],
        ),
      ),
    );
  }

  Padding _buildTopCalendar(BuildContext context) {
    final DateTime now = DateTime.now();
    final List<String> weekDaysNames =
        DateFormat.EEEE(AppLocalization.of().locale.toString())
            .dateSymbols
            .STANDALONEWEEKDAYS;
    final selectedDayProvider = StateProvider<int>((ref) {
      return 0;
    });
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SizedBox(
          height: 110.v,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              DateTime theDay = now.subtract(Duration(days: index));
              int weekDayIndex = theDay.weekday == 7 ? 0 : theDay.weekday;
              return Consumer(
                builder: (context, ref, child) => _buildDayNumberCard(
                  context,
                  day: weekDaysNames[weekDayIndex].substring(0, 3),
                  num: theDay.day,
                  selected: index == ref.watch(selectedDayProvider),
                  onTap: () {
                    ref
                        .watch(selectedDayProvider.notifier)
                        .update((state) => index);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 27.h);
            },
            itemCount: 7,
          ),
        ));
  }

  /// Common widget
  Widget _buildMealSectionTitlePart(
    BuildContext context, {
    required String lunch,
    required String kcalKcal,
    List<int>? mealCalories,
    int? totalCalories,
  }) {
    final isDoneStatusProvider = StateProvider<bool>((ref) {
      return false;
    });

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(lunch,
                style: CustomTextStyles.titleLargeBold.copyWith(
                    color: theme.colorScheme.onPrimary.withOpacity(1))),
            SizedBox(height: 10.v),
            Row(children: [
              CustomImageView(
                  imagePath: ImageConstant.imgClockOrange700,
                  color: theme.colorScheme.primary,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(top: 2.v)),
              Padding(
                  padding: EdgeInsets.only(left: 4.h, bottom: 2.v),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "$totalCalories",
                            style:
                                CustomTextStyles.headlineSmallRobotofff4f4fc),
                        const TextSpan(text: " "),
                        TextSpan(
                            text: "kcal /450 kcal",
                            style: CustomTextStyles.bodyLargebff4f4fc)
                      ]),
                      textAlign: TextAlign.left))
            ])
          ]),
          Consumer(
            builder: (context, ref, child) => Padding(
              padding: EdgeInsets.only(bottom: 35.v),
              child: CustomIconButton(
                onTap: () {
                  ref
                      .watch(isDoneStatusProvider.notifier)
                      .update((state) => !state);
                },
                height: 25.adaptSize,
                width: 25.adaptSize,
                decoration: ref.watch(isDoneStatusProvider)
                    ? IconButtonStyleHelper.fillBlueGray
                    : IconButtonStyleHelper.fillGray,
                child: CustomImageView(
                  imagePath: ImageConstant.imgCheckmarkBlueGray900,
                  color: ref.watch(isDoneStatusProvider)
                      ? theme.colorScheme.primary
                      : null,
                ),
              ),
            ),
          )
        ]);
  }

  /// Common widget
  Widget _buildDayNumberCard(
    BuildContext context, {
    required String day,
    required int num,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: selected ? EdgeInsets.symmetric(horizontal: 6.h) : null,
          decoration: selected
              ? AppDecoration.fillBlack
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22)
              : BoxDecoration(borderRadius: BorderRadiusStyle.circleBorder16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
                  selected ? MainAxisAlignment.center : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  day,
                  style: CustomTextStyles.titleMediumOnPrimaryContainer
                      .copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(0.75)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.v),
                Container(
                  width: selected ? 36.adaptSize : null,
                  padding:
                      selected ? EdgeInsets.symmetric(horizontal: 3.h) : null,
                  decoration: selected
                      ? AppDecoration.fillOnPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder16)
                      : null,
                  child: Text(
                    num.toString(),
                    style: selected
                        ? CustomTextStyles.headlineSmallRobotoPrimary
                        : CustomTextStyles.titleMedium18.copyWith(
                            color: theme.colorScheme.onPrimary.withOpacity(1)),
                    textAlign: TextAlign.center,
                  ),
                )
              ])),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
