import 'package:fait/source/views/fitness/widgets/custom_circular_indicator_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/cupertino.dart';

class OverviewPercentagesWidget extends StatelessWidget {
  final String cardioText;
  final String cardioPercentageText;
  final String strengthText;
  final String strengthPercentageText;
  final String stretchText;
  final String stretchPercentageText;
  final double cardioPercentageIndicator;
  final double strengthPercentageIndicator;
  final double stretchPercentageIndicator;
  const OverviewPercentagesWidget({
    super.key,
    required this.cardioText,
    required this.cardioPercentageText,
    required this.strengthText,
    required this.strengthPercentageText,
    required this.stretchText,
    required this.stretchPercentageText,
    required this.cardioPercentageIndicator,
    required this.strengthPercentageIndicator,
    required this.stretchPercentageIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 112.h,
            height: 112.v,
            child: CustomCircularProgressIndicator(
              cardioPercentage: cardioPercentageIndicator,
              strengthPercentage: strengthPercentageIndicator,
              stretchPercentage: stretchPercentageIndicator,
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 184.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      margin: EdgeInsets.symmetric(vertical: 5.v),
                      decoration: BoxDecoration(
                        color: appTheme.deepOrangeA100,
                        borderRadius: BorderRadius.circular(7.h),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 15.h, top: 1.v, bottom: 2.v),
                      child: Text(cardioText,
                          style:
                              CustomTextStyles.titleMediumOnPrimaryContainer),
                    ),
                    const Spacer(),
                    Text(cardioPercentageText,
                        style: CustomTextStyles.titleLargeBold),
                  ],
                ),
              ),
              SizedBox(height: 26.v),
              SizedBox(
                width: 184.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      margin: EdgeInsets.symmetric(vertical: 5.v),
                      decoration: BoxDecoration(
                        color: appTheme.deepPurple400,
                        borderRadius: BorderRadius.circular(7.h),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.h, top: 2.v),
                      child: Text(strengthText,
                          style:
                              CustomTextStyles.titleMediumOnPrimaryContainer),
                    ),
                    const Spacer(),
                    Text(strengthPercentageText,
                        style: CustomTextStyles.titleLargeBold),
                  ],
                ),
              ),
              SizedBox(height: 26.v),
              SizedBox(
                width: 184.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      margin: EdgeInsets.symmetric(vertical: 5.v),
                      decoration: BoxDecoration(
                        color: appTheme.lightBlueA200,
                        borderRadius: BorderRadius.circular(7.h),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 12.h, top: 1.v, bottom: 2.v),
                      child: Text(stretchText,
                          style:
                              CustomTextStyles.titleMediumOnPrimaryContainer),
                    ),
                    const Spacer(),
                    Text(stretchPercentageText,
                        style: CustomTextStyles.titleLargeBold),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
