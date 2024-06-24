part of '../views/nav_bar_screens/profile_screen.dart';

class _MyAvatarSectionWidget extends ConsumerStatefulWidget {
  const _MyAvatarSectionWidget({super.key});

  @override
  ConsumerState<_MyAvatarSectionWidget> createState() =>
      _MyAvatarSectionWidgetState();
}

class _MyAvatarSectionWidgetState
    extends ConsumerState<_MyAvatarSectionWidget> {
  late ImagePickerHandler _avatarImagePickerHandler;

  @override
  void initState() {
    super.initState();
    _avatarImagePickerHandler =
        ImagePickerHandler(onImageChanged: _onAvatarImageChanged);
  }

  void _onAvatarImageChanged(File image) {
    ref.read(profileProvider).getAvatarPictures(userId, image);
  }

  @override
  Widget build(BuildContext context) {
    final profileViewModel = ref.watch(profileProvider);
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 9.v),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 32, bottom: 16, end: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("My Avatar",
                      style: CustomTextStyles.headlineSmallRobotoSemiBold),
                  SizedBox(height: 12.v),
                  // Text("Level 3 Mindful walker",
                  //     style: CustomTextStyles.bodyLargeOnPrimaryContainer18)
                ]),
                if (profileViewModel.avatarPicturesResponse.status ==
                    Status.completed)
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: CustomElevatedButton(
                        height: 35.v,
                        width: SizeUtils.width / 6,
                        text: "Try Again",
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        buttonTextStyle: CustomTextStyles.titleSmallffffffff,
                        onPressed: () {
                          _avatarImagePickerHandler.showOptions(context);
                        }),
                  ),
              ],
            ),
            SizedBox(
              height: 30.v,
            ),

            profileViewModel.avatarPicturesResponse.status == Status.loading
                ? Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.v,
                        ),
                        const CircularProgressIndicator(),
                        SizedBox(
                          height: 30.v,
                        ),
                      ],
                    ),
                  )
                : profileViewModel.avatarPicturesResponse.status == Status.error
                    ? Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.v,
                            ),
                            Text(
                              "Upload an updated picture to your body!",
                              style: CustomTextStyles.bodyMediumBluegray40001_2
                                  .copyWith(fontSize: 18.fSize),
                            ),
                            SizedBox(
                              height: 10.v,
                            ),
                            CustomElevatedButton(
                                height: 48.v,
                                width: SizeUtils.width / 3,
                                text: "Upload Picture",
                                buttonStyle: CustomButtonStyles.fillPrimary,
                                buttonTextStyle: CustomTextStyles
                                    .titleMediumOnPrimaryContainer
                                    .copyWith(color: Colors.white),
                                onPressed: () {
                                  _avatarImagePickerHandler
                                      .showOptions(context);
                                }),
                            SizedBox(
                              height: 30.v,
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath:
                                    profileViewModel.pastAvatarPicturePath ??
                                        profileViewModel
                                            .avatarPicturesResponse.data ??
                                        ImageConstant.imgShape1,
                                height: 186.v,
                                // width: 63.h,
                              ),
                              SizedBox(
                                height: 5.v,
                              ),
                              Text(
                                  profileViewModel.currentAvatarPicturePath ==
                                          null
                                      ? "Current"
                                      : "Past",
                                  style: CustomTextStyles
                                      .bodyLargeOnPrimaryContainer18
                                      .copyWith(color: appTheme.indigo500))
                            ],
                          ),
                          if (profileViewModel.currentAvatarPicturePath != null)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomImageView(
                                  imagePath: profileViewModel
                                          .currentAvatarPicturePath ??
                                      ImageConstant.imgShape1,
                                  height: 186.v,
                                  // width: 63.h,
                                ),
                                SizedBox(
                                  height: 5.v,
                                ),
                                Text("Current",
                                    style: CustomTextStyles
                                        .bodyLargeOnPrimaryContainer18
                                        .copyWith(color: appTheme.indigo500))
                              ],
                            ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgShape1,
                                height: 186.v,
                                // width: 63.h,
                              ),
                              SizedBox(
                                height: 5.v,
                              ),
                              Text("Future",
                                  style: CustomTextStyles
                                      .bodyLargeOnPrimaryContainer18
                                      .copyWith(color: appTheme.indigo500))
                            ],
                          ),
                          // CustomImageView(
                          //   imagePath: ImageConstant.imgShape1,
                          //   height: 200.v,
                          //   // width: 80.h,
                          // ),
                          // CustomImageView(
                          //   imagePath: ImageConstant.imgShape1,
                          //   height: 220.v,
                          //   // width: 90.h,
                          // ),
                        ],
                      ),
            // SfLinearGauge(
            //   axisTrackStyle: LinearAxisTrackStyle(color: appTheme.indigo500),
            //   axisLabelStyle: TextStyle(color: appTheme.indigo500),
            //   majorTickStyle: LinearTickStyle(color: appTheme.indigo500),
            //   minorTickStyle: LinearTickStyle(color: appTheme.indigo500),
            //   minimum: 1,
            //   maximum: 12,
            // ),
            SizedBox(
              height: 35.h,
            )
          ],
        ),
      ),
    );
  }
}
