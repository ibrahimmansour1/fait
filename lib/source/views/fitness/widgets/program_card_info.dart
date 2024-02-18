import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class ProgramCardInfo extends StatelessWidget {
  const ProgramCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.v,
      left: 0.h,
      right: 0.h,
      child: Container(
        width: 358.h,
        height: 428.v,
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.h)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "Day 1",
                    style: CustomTextStyles
                        .headlineSmallRobotoOnPrimaryContainerSemiBold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.h),
                    child: Text(
                      "Full Body A",
                      style: CustomTextStyles.headlineSmallRobotoSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 17.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text(
                          "Nov 16",
                          style:
                              CustomTextStyles.titleMediumOnPrimaryContainer18,
                        ),
                      ),
                      Container(
                        height: 5.adaptSize,
                        width: 5.adaptSize,
                        margin: EdgeInsets.only(top: 8.v, bottom: 10.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(0.75),
                          borderRadius: BorderRadius.circular(2.h),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text(
                          "3 exercises",
                          style:
                              CustomTextStyles.titleMediumOnPrimaryContainer18,
                        ),
                      ),
                      Container(
                        height: 5.adaptSize,
                        width: 5.adaptSize,
                        margin: EdgeInsets.only(top: 8.v, bottom: 10.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(0.75),
                          borderRadius: BorderRadius.circular(2.h),
                        ),
                      ),
                      Text(
                        "3 281 kg",
                        style: CustomTextStyles.titleMediumOnPrimaryContainer18,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 5.adaptSize,
                  width: 5.adaptSize,
                  margin: EdgeInsets.only(left: 12.h, top: 8.v, bottom: 10.v),
                  decoration: BoxDecoration(
                    color:
                        theme.colorScheme.onPrimaryContainer.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(2.h),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(
                    "32 min",
                    style: CustomTextStyles.titleMediumOnPrimaryContainer18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
