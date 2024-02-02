import 'package:fait/source/localization/app_localization.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class NotifcationsItemWidget extends StatelessWidget {
  final showNotificationDateTimeProvider = StateProvider<bool>((ref) {
    return false;
  });
  NotifcationsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => InkWell(
        onTap: () {
          ref
              .read(showNotificationDateTimeProvider.notifier)
              .update((state) => !state);
        },
        child: Column(
          children: [
            Container(
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
            SizedBox(
              height: 5.v,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: AnimatedOpacity(
                opacity:
                    ref.watch(showNotificationDateTimeProvider) ? 1.0 : 0.0,
                duration: animationDuration,
                child: Visibility(
                  visible: ref.watch(showNotificationDateTimeProvider),
                  child: const Text(
                    "Sat,12th May 10:30 am",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
