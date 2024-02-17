import 'package:fait/source/views/fitness/widgets/arrow_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fait/utils/app_export.dart';

class OpenCameraScreen extends StatefulWidget {
  const OpenCameraScreen({Key? key}) : super(key: key);

  @override
  _OpenCameraScreenState createState() => _OpenCameraScreenState();
}

class _OpenCameraScreenState extends State<OpenCameraScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    getPermissionStatus(Permission.camera); // Request camera permission
    _initializeControllerFuture = initializeCamera();
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
                CameraPreview(_cameraController),
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
                      SizedBox(height: 550.v),
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
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.v),
          decoration: AppDecoration.fillPrimary
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder32),
          child: Row(
            children: [
              Container(
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder22),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgClockBlack900,
                      height: 48.adaptSize,
                      width: 48.adaptSize,
                      alignment: Alignment.center)),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 8.v, bottom: 10.v),
                  child: Text("9 sec",
                      style: CustomTextStyles
                          .headlineSmallRobotoOnPrimaryContainerRegular))
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.h),
              color: appTheme.blueGray80004),
          height: 64.v,
          width: 112.h,
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
