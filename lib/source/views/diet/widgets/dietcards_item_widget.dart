import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../widgets/replace_with_screen/replace_with_tab_container_screen.dart';

// ignore: must_be_immutable
class DietcardsItemWidget extends StatelessWidget {
  DietcardsItemWidget({
    Key? key,
    this.onTapDietCard,
    this.replacable = true,
    this.favourite = false,
  }) : super(
          key: key,
        ) {
    isFavouriteProvider = StateProvider<bool>((ref) {
      return favourite;
    });
  }

  VoidCallback? onTapDietCard;
  bool replacable;
  bool favourite;
  StateProvider<bool>? isFavouriteProvider;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Slidable(
        enabled: replacable,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            Container(
                margin: EdgeInsets.only(left: 16.h, top: 36.v, bottom: 36.v),
                decoration: AppDecoration.fillOnPrimaryContainer
                    .copyWith(borderRadius: BorderRadiusStyle.circleBorder64),
                child: CustomImageView(
                    imagePath: ImageConstant.imgCloseDeepPurpleA200,
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    fit: BoxFit.cover,
                    radius: BorderRadius.circular(16.h),
                    alignment: Alignment.center)),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (_) => ReplaceWithTabContainerScreen(
                          isDiet: true,
                        ));
              },
              child: Container(
                  margin: EdgeInsets.only(left: 8.h, top: 36.v, bottom: 36.v),
                  decoration: AppDecoration.fillOnPrimaryContainer
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder16),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgCloseOrangeA20032x32,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      fit: BoxFit.cover,
                      radius: BorderRadius.circular(16.h),
                      alignment: Alignment.center)),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            onTapDietCard!.call();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(8.h, 7.v, 8.h, 6.v),
            decoration: AppDecoration.outlinePrimary2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage80x80,
                  height: 72.v,
                  width: 80.h,
                  radius: BorderRadius.circular(
                    8.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 137.h,
                        child: Text(
                          "Salad with wheat and white egg",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleMediumGray1000118,
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Text(
                        "200 cals",
                        style: CustomTextStyles.bodyLargeGray10001,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    ref
                        .read(isFavouriteProvider!.notifier)
                        .update((state) => !state);
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFavoriteBlueGray90020x20,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    color: ref.watch(isFavouriteProvider!)
                        ? theme.colorScheme.primary
                        : null,
                    margin: EdgeInsets.only(bottom: 52.v),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
