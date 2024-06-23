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
    ref.read(profileProvider).getAvatarPictures(userId, image.path);
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
                                    .titleMediumOnPrimaryContainer,
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
