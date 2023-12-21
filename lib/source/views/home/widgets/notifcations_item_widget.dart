import 'package:fait/source/localization/app_localization.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class NotifcationsItemWidget extends StatelessWidget {
  const NotifcationsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.v),
        decoration: AppDecoration.fillGray90002.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.v),
              child: CustomIconButton(
                height: 64.adaptSize,
                width: 64.adaptSize,
                padding: EdgeInsets.all(16.h),
                decoration: IconButtonStyleHelper.fillBlue,
                child: CustomImageView(
                  imagePath: ImageConstant.imgVectorLightBlueA200,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(
                    "lbl_drink_more".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 23.v),
                Text(
                  "msg_you_drink_less_than".tr,
                  style: CustomTextStyles.titleMediumSemiBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
