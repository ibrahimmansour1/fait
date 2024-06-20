import 'package:fait/utils/app_export.dart';
import 'package:flutter/cupertino.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String date;
  final String exercises;
  final String textKg;
  final String duration;
  final void Function()? onTap;
  final String imagePath;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.exercises,
    required this.textKg,
    required this.duration,
    this.onTap,
    required this.date,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(imagePath: imagePath, height: 72.v, width: 20.h),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 6.v),
              decoration: AppDecoration.fillBluegray80004
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: CustomTextStyles.titleLargeBold),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text(date,
                            style:
                                CustomTextStyles.titleMediumOnPrimaryContainer),
                      ),
                    ],
                  ),
                  SizedBox(height: 13.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text(exercises,
                            style:
                                CustomTextStyles.titleMediumOnPrimaryContainer),
                      ),
                      Container(
                        height: 5.adaptSize,
                        width: 5.adaptSize,
                        margin: EdgeInsets.only(top: 7.v, bottom: 8.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimary.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(2.h),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text(textKg,
                            style:
                                CustomTextStyles.titleMediumOnPrimaryContainer),
                      ),
                      Container(
                        height: 5.adaptSize,
                        width: 5.adaptSize,
                        margin: EdgeInsets.only(top: 7.v, bottom: 8.v),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimary.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(2.h),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text(
                          duration,
                          style: CustomTextStyles.titleMediumOnPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
