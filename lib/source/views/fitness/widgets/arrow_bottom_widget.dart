import 'package:fait/source/widgets/custom_icon_button.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class ArrowBottomWidget extends StatelessWidget {
  const ArrowBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 24.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
              height: 64.adaptSize,
              width: 64.adaptSize,
              padding: EdgeInsets.all(20.h),
              decoration: IconButtonStyleHelper.fillBlueGray,
              child: CustomImageView(imagePath: ImageConstant.imgArrowLeft)),
          Container(
            width: 244.h,
            height: 80.v,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40.h)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 160.h,
                  height: 80.v,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF97EABE), // Start color
                          Color(0xFFFECACE), // End color
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(40.h)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5.v,
                              left: 18.h,
                            ),
                            child: Text(
                              '3',
                              style: CustomTextStyles
                                  .headlineSmallRobotoBlack900SemiBold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 15.h,
                            ),
                            child: Text(
                              'Good',
                              style: CustomTextStyles
                                  .headlineSmallRobotoBlack900Regular,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5.v,
                              right: 18.h,
                            ),
                            child: Text(
                              '1',
                              style: CustomTextStyles
                                  .headlineSmallRobotoBlack900SemiBold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: 23.h,
                            ),
                            child: Text(
                              'Bad',
                              style: CustomTextStyles
                                  .headlineSmallRobotoBlack900Regular,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15.h,
                      ),
                      child: Text(
                        "4/8",
                        style: CustomTextStyles.headlineSmallRobotoSemiBold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15.h,
                      ),
                      child: Text(
                        "Reps",
                        style: CustomTextStyles
                            .titleMediumInterOnPrimaryContainerSemiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomIconButton(
            height: 64.adaptSize,
            width: 64.adaptSize,
            padding: EdgeInsets.all(20.h),
            decoration: IconButtonStyleHelper.fillBlueGray,
            child: CustomImageView(imagePath: ImageConstant.imgIconArrowRight),
          ),
        ],
      ),
    );
  }
}
