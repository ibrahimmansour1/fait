import 'package:fait/source/providers/fitness/listen_and_speak_provider.dart';
import 'package:fait/source/views/fitness/views/pose_detection/pose_detector.dart';
import 'package:fait/source/views/fitness/widgets/arrow_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fait/utils/app_export.dart';

import '../wrong_exercises_steps_screen/wrong_exercises_step_screen.dart';

class OpenCameraScreen extends ConsumerStatefulWidget {
  const OpenCameraScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _OpenCameraScreenState();
}

class _OpenCameraScreenState extends ConsumerState<OpenCameraScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  late final ListenAndSpeakNotifier listenAndSpeakViewModel;

  @override
  void initState() {
    super.initState();
    getPermissionStatus(Permission.camera); // Request camera permission
    _initializeControllerFuture = initializeCamera();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      listenAndSpeakViewModel = ref.watch(listenAndSpeakProvider);
    });
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    return _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              fit: StackFit.expand,
              children: [
                // CameraPreview(_cameraController),
                const PoseDetectionPage(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 36.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowLeft,
                        height: 24.v,
                        width: 16.h,
                        margin: EdgeInsets.only(
                          left: 16.h,
                          top: 16.v,
                        ),
                        onTap: () {
                          onTapImgArrowLeft(context);
                        },
                      ),
                      SizedBox(height: 20.v),
                      _buildTopPart(context),
                      SizedBox(height: 40.v),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appTheme.red500,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.h),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 8.v),
                            child: Text(
                              'Wrong Step',
                              style: CustomTextStyles.headlineSmallInter,
                            ),
                          ),
                          onPressed: () {
                            listenAndSpeakViewModel.stopListen();
                            listenAndSpeakViewModel.stopSpeak();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const WrongExercisesStepScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.v),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appTheme.amber400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.h),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 8.v),
                            child: Text(
                              'Speak',
                              style: CustomTextStyles.headlineSmallInter,
                            ),
                          ),
                          onPressed: () {
                            listenAndSpeakViewModel
                                .speak("Good job! keep stretching");
                          },
                        ),
                      ),
                      SizedBox(height: 20.v),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appTheme.blue50001,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.h),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 8.v),
                            child: Text(
                              'listen',
                              style: CustomTextStyles.headlineSmallInter,
                            ),
                          ),
                          onPressed: () {
                            listenAndSpeakViewModel.listen();
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 10,
                      ),
                      Container(
                        width: 205.h,
                        margin: EdgeInsets.only(left: 40.h),
                        child: Text(
                          "Good job keep stretching",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles
                              .headlineLargeOnPrimaryContainer
                              .copyWith(height: 1.50),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: const ArrowBottomWidget(),
    );
  }

  /// Section Widget
  Widget _buildTopPart(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 3.v),
          decoration: AppDecoration.fillPrimary
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder32),
          child: Row(
            children: [
              Container(
                  height: 40.adaptSize,
                  width: 40.adaptSize,
                  decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder22),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgClockBlack900,
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      alignment: Alignment.center)),
              Padding(
                padding: EdgeInsets.only(left: 16.h, top: 8.v, bottom: 10.v),
                child: Text("9 sec",
                    style: CustomTextStyles
                        .headlineSmallRobotoOnPrimaryContainerRegular),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.h),
              color: appTheme.blueGray80004),
          height: 55.v,
          width: 100.h,
          child: Center(
            child: Text(
              '75%',
              style: CustomTextStyles.headlineLargeRegular,
            ),
          ),
        ),
      ],
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  void getPermissionStatus(Permission permission) async {
    PermissionStatus status = await permission.request();
    if (status == PermissionStatus.granted) {
      // Permission granted, do nothing
    } else if (status == PermissionStatus.denied) {
      // Permission denied, request again
      permission.request();
    } else if (status == PermissionStatus.permanentlyDenied ||
        status == PermissionStatus.restricted) {
      // Permission permanently denied or restricted, open app settings
      openAppSettings();
    }
  }
}
