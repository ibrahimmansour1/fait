import 'package:fait/source/localization/app_localization.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GoalscardsItemWidget extends StatelessWidget {
  const GoalscardsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.h,
      child: Container(
        padding: EdgeInsets.symmetric(
          // horizontal: 42.h,
          vertical: 28.v,
        ),
        decoration: AppDecoration.fillBluegray80004.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder22,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 11.v,
                bottom: 12.v,
              ),
              child: SizedBox(
                height: 70.adaptSize,
                width: 70.adaptSize,
                child: CircularProgressIndicator(
                  value: 0.27,
                  backgroundColor: appTheme.blueGray90003,
                  color: appTheme.tealA700,
                  strokeWidth: 12.adaptSize,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 32.h,
                bottom: 5.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "lbl_lose_20_pound".tr,
                    style: CustomTextStyles.titleMediumOnPrimaryContainer,
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    "lbl_27_through".tr,
                    style: CustomTextStyles.titleMediumOnPrimaryContainer,
                  ),
                  SizedBox(height: 7.v),
                  Text(
                    "msg_34_72_days_complete".tr,
                    style: CustomTextStyles.titleMediumOnPrimaryContainer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
