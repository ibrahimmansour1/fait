import 'package:fait/source/models/fitness/exercise_response_body/exercise_response_body.dart';
import 'package:fait/source/models/fitness/exercise_response_body_by_name_or_id/exercise_response_body_by_name_or_id.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../widgets/replace_with_screen/replace_with_tab_container_screen.dart';

// ignore: must_be_immutable
class ExerciseCardWidget extends StatelessWidget {
  ExerciseResponseBody? exerciseModel;
  bool favourite;
  bool replacable;
  StateProvider<bool>? isFavouriteProvider;
  VoidCallback? onTap;

  ExerciseCardWidget({
    super.key,
    this.favourite = false,
    this.replacable = true,
    this.onTap,
    this.exerciseModel,
  }) {
    isFavouriteProvider = StateProvider<bool>((ref) {
      return favourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Slidable(
        enabled: replacable,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            Container(
                height: 32.adaptSize,
                width: 32.adaptSize,
                margin: EdgeInsets.only(left: 16.h, top: 36.v, bottom: 36.v),
                decoration: AppDecoration.fillOnPrimaryContainer
                    .copyWith(borderRadius: BorderRadiusStyle.circleBorder16),
                child: CustomImageView(
                    imagePath: ImageConstant.imgCloseDeepPurpleA200,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    radius: BorderRadius.circular(16.h),
                    alignment: Alignment.center)),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (_) => ReplaceWithTabContainerScreen());
              },
              child: Container(
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                  margin: EdgeInsets.only(left: 8.h, top: 36.v, bottom: 36.v),
                  decoration: AppDecoration.fillOnPrimaryContainer
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder16),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCloseOrangeA20032x32,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      radius: BorderRadius.circular(16.h),
                      alignment: Alignment.center)),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 16.v),
            decoration: AppDecoration.fillBluegray80004
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomImageView(
                        imagePath:
                            // exerciseModel!.image
                            ImageConstant.imgMindBodyBalance,
                        height: 72.adaptSize,
                        width: 72.adaptSize,
                        radius: BorderRadius.circular(8.h)),
                    SizedBox(
                      width: 30.h,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 5.v,
                                  width: 32.h,
                                  decoration: BoxDecoration(
                                      color: ref.watch(isFavouriteProvider!)
                                          ? theme.colorScheme.primary
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(2.h))),
                              SizedBox(height: 9.v),
                              Text(exerciseModel!.name!,
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 6.v),
                              Text(
                                  // exerciseModel!.steps
                                  "null",
                                  style: theme.textTheme.titleSmall)
                            ])),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    ref
                        .read(isFavouriteProvider!.notifier)
                        .update((state) => !state);
                  },
                  child: CustomImageView(
                      imagePath: ImageConstant.imgFavoriteBlueGray90020x20,
                      height: 18.v,
                      width: 20.h,
                      color:
                          // ref.watch(isFavouriteProvider!)
                          exerciseModel!.isInFavorite!
                              ? theme.colorScheme.primary
                              : null,
                      margin: EdgeInsets.symmetric(vertical: 27.v)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
