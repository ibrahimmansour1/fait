part of '../views/nav_bar_screens/profile_screen.dart';

class _MyAvatarSectionWidget extends StatelessWidget {
  const _MyAvatarSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 9.v),
      decoration: AppDecoration.gradientGrayToGray
          .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 32, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("My Avatar",
                  style: CustomTextStyles.headlineSmallRobotoSemiBold),
              SizedBox(height: 12.v),
              Text("Level 3 Mindful walker",
                  style: CustomTextStyles.bodyLargeOnPrimaryContainer18)
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgShape1,
                  height: 186.v,
                  width: 63.h,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgShape1,
                  height: 200.v,
                  width: 80.h,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgShape1,
                  height: 220.v,
                  width: 90.h,
                ),
              ],
            ),
            SfLinearGauge(
              axisTrackStyle: LinearAxisTrackStyle(color: appTheme.indigo500),
              axisLabelStyle: TextStyle(color: appTheme.indigo500),
              majorTickStyle: LinearTickStyle(color: appTheme.indigo500),
              minorTickStyle: LinearTickStyle(color: appTheme.indigo500),
              minimum: 1,
              maximum: 12,
            ),
          ],
        ),
      ),
    );
  }
}
