import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

// ignore: must_be_immutable
class DailyintakeItemWidget extends StatelessWidget {
  final String text;
  final String textGram;
  final String textPercentage;
  final Color color;
  const DailyintakeItemWidget(
      {Key? key,
      required this.text,
      required this.textGram,
      required this.textPercentage,
      required this.color})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(9.h, 15.v, 9.h, 13.v),
      decoration: AppDecoration.outlinePrimary1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(left: 23.h),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                4.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              top: 2.v,
            ),
            child: Text(
              text,
              style: CustomTextStyles.titleMediumOnPrimaryContainerSemiBold18,
            ),
          ),
          const Spacer(
            flex: 50,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              textGram,
              style: CustomTextStyles.titleMediumOnPrimaryContainerSemiBold18,
            ),
          ),
          const Spacer(
            flex: 50,
          ),
          Text(
            textPercentage,
            style: CustomTextStyles.titleMediumOnPrimaryContainerSemiBold18,
          ),
        ],
      ),
    );
  }
}
