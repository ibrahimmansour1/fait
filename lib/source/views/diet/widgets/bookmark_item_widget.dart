import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

// ignore: must_be_immutable
class BookmarkItemWidget extends StatelessWidget {
  BookmarkItemWidget({
    Key? key,
    this.onTapDietCard,
  }) : super(
          key: key,
        );

  VoidCallback? onTapDietCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              imagePath: ImageConstant.imgImage4,
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
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgFavoritePrimary36x36,
              height: 20.adaptSize,
              width: 20.adaptSize,
              margin: EdgeInsets.only(bottom: 52.v),
            ),
          ],
        ),
      ),
    );
  }
}
