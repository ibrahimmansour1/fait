import 'package:fait/source/localization/app_localization.dart';
import 'package:fait/source/views/home/widgets/notifcations_item_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class NotifcationsScreen extends StatelessWidget {
  const NotifcationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillBlueGray,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 23.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26.v),
                CustomImageView(
                    imagePath: ImageConstant.imgArrowLeft,
                    height: 24.v,
                    width: 16.h,
                    onTap: () {
                      onTapImgArrowLeft(context);
                    }),
                SizedBox(height: 30.v),
                Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Text("lbl_notification".tr,
                        style: theme.textTheme.headlineLarge)),
                SizedBox(height: 37.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Row(children: [
                              Text("lbl_earlier".tr,
                                  style: CustomTextStyles
                                      .headlineSmallRobotoSemiBold),
                              Container(
                                  width: 26.adaptSize,
                                  margin: EdgeInsets.only(left: 16.h, top: 5.v),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.h, vertical: 3.v),
                                  decoration: AppDecoration.fillPrimary
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder12),
                                  child: Text("lbl_32".tr,
                                      style: CustomTextStyles
                                          .bodyMediumOnPrimaryContainer_1))
                            ])),
                        SizedBox(height: 32.v),
                        _buildNotifcations(context),
                        SizedBox(height: 30.v),
                        Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Text("lbl_last_week".tr,
                                textAlign: TextAlign.start,
                                style: CustomTextStyles
                                    .headlineSmallRobotoSemiBold)),
                        SizedBox(height: 32.v),
                        _buildNotifcations(context),
                        SizedBox(height: 32.v),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNotifcations(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 24.v);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return NotifcationsItemWidget();
                })));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
