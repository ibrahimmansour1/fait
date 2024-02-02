import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/fitness/views/replace_with_screen/replace_with_tab_container_screen.dart';

// ignore: must_be_immutable
class ExerciseCardWidget extends StatelessWidget {
  bool favourite;
  bool replacable;
  StateProvider<bool>? isFavouriteProvider;

  ExerciseCardWidget(
      {super.key, this.favourite = false, this.replacable = true}) {
    isFavouriteProvider = StateProvider<bool>((ref) {
      return favourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
            stepWidth: replacable ? 220.h : 175.h,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder8),
                child: Consumer(
                  builder: (context, ref, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  // onTapExerciseContent(context);
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 27.h, vertical: 16.v),
                                    decoration: AppDecoration.fillBluegray80004
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgMindBodyBalance,
                                                  height: 72.adaptSize,
                                                  width: 72.adaptSize,
                                                  radius: BorderRadius.circular(
                                                      8.h)),
                                              SizedBox(
                                                width: 30.h,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 7.v),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            height: 5.v,
                                                            width: 32.h,
                                                            decoration: BoxDecoration(
                                                                color: ref.watch(
                                                                        isFavouriteProvider!)
                                                                    ? theme
                                                                        .colorScheme
                                                                        .primary
                                                                    : Colors
                                                                        .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.h))),
                                                        SizedBox(height: 9.v),
                                                        Text("Side Jump",
                                                            style: theme
                                                                .textTheme
                                                                .titleMedium),
                                                        SizedBox(height: 6.v),
                                                        Text("15 times",
                                                            style: theme
                                                                .textTheme
                                                                .titleSmall)
                                                      ])),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              ref
                                                  .read(isFavouriteProvider!
                                                      .notifier)
                                                  .update((state) => !state);
                                            },
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgFavoriteBlueGray90020x20,
                                                height: 18.v,
                                                width: 20.h,
                                                color: ref.watch(
                                                        isFavouriteProvider!)
                                                    ? theme.colorScheme.primary
                                                    : null,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 27.v)),
                                          )
                                        ])))),
                        if (replacable)
                          Container(
                              height: 32.adaptSize,
                              width: 32.adaptSize,
                              margin: EdgeInsets.only(
                                  left: 16.h, top: 36.v, bottom: 36.v),
                              decoration: AppDecoration.fillOnPrimaryContainer
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder16),
                              child: CustomImageView(
                                  imagePath:
                                      ImageConstant.imgCloseDeepPurpleA200,
                                  height: 32.adaptSize,
                                  width: 32.adaptSize,
                                  radius: BorderRadius.circular(16.h),
                                  alignment: Alignment.center)),
                        if (replacable)
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  useRootNavigator: true,
                                  isScrollControlled: true,
                                  builder: (_) =>
                                      const ReplaceWithTabContainerScreen());
                            },
                            child: Container(
                                height: 32.adaptSize,
                                width: 32.adaptSize,
                                margin: EdgeInsets.only(
                                    left: 8.h, top: 36.v, bottom: 36.v),
                                decoration: AppDecoration.fillOnPrimaryContainer
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder16),
                                child: CustomImageView(
                                    imagePath:
                                        ImageConstant.imgCloseOrangeA20032x32,
                                    height: 32.adaptSize,
                                    width: 32.adaptSize,
                                    radius: BorderRadius.circular(16.h),
                                    alignment: Alignment.center)),
                          )
                      ]),
                ))));
  }
}
