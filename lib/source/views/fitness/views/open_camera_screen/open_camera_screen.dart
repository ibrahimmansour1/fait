import 'package:fait/source/providers/fitness/listen_and_speak_provider.dart';
import 'package:fait/source/views/fitness/views/pose_detection/pose_detector.dart';
import 'package:fait/source/views/fitness/widgets/arrow_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fait/utils/app_export.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import '../wrong_exercises_steps_screen/wrong_exercises_step_screen.dart';
import 'package:image/image.dart' as img;

class OpenCameraScreen extends ConsumerStatefulWidget {
  const OpenCameraScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _OpenCameraScreenState();
}

class _OpenCameraScreenState extends ConsumerState<OpenCameraScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  late final ListenAndSpeakNotifier listenAndSpeakViewModel;
  WebSocketChannel? _channel;

  @override
  void initState() {
    super.initState();
    getPermissionStatus(Permission.camera); // Request camera permission
    _initializeControllerFuture = initializeCamera();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      listenAndSpeakViewModel = ref.watch(listenAndSpeakProvider);
    });
    _initWebSocket();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.low,
    );

    await _cameraController.initialize().then((value) {
      _cameraController.startImageStream((CameraImage image) {
        ref.watch(framesCounter.notifier).update((state) => state++);
        if (ref.watch(framesCounter) % 5 == 0) {
          sendFrame(image);
        }
        // Uint8List imageData = image.planes[0].bytes;
        // // Decode the image
        // img.Image? jpgImage = img.decodeImage(imageData);

        // if (jpgImage != null) {
        //   // Encode the image to PNG
        //   List<int> pngBytes = img.encodePng(jpgImage);

        //   // Process camera image to send to the server
        //   sendFrame(pngBytes);
        // } else {
        //   // Handle the error case where the image couldn't be decoded
        //   log('Failed to decode image');
        // }
      });
    });
  }

  void _initWebSocket() {
    _channel = IOWebSocketChannel.connect(
      Uri.parse('ws://192.168.127.133:6000/joint-processing'),
    );

    _channel!.stream.listen(
      (message) {
        log('Message received: $message');
      },
      onDone: () {
        log('Closed: ${_channel!.closeReason}');
      },
      onError: (error) {
        log('Error: $error');
        _initWebSocket();
      },
    );
  }

  Future<void> sendFrame(CameraImage image) async {
    try {
      // Convert YUV to RGB
      final int width = image.width;
      final int height = image.height;
      final int yRowStride = image.planes[0].bytesPerRow;
      final int uvRowStride = image.planes[1].bytesPerRow;
      final int uvPixelStride = image.planes[1].bytesPerPixel!;

      final Uint8List rgbBytes = Uint8List(3 * width * height);

      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          final int uvIndex = uvPixelStride * (x ~/ 2) + uvRowStride * (y ~/ 2);
          final int index = y * yRowStride + x;

          final int yValue = image.planes[0].bytes[index];
          final int uValue = image.planes[1].bytes[uvIndex];
          final int vValue = image.planes[2].bytes[uvIndex];

          // Compute RGB values
          final int r =
              (yValue + (1.370705 * (vValue - 128))).clamp(0, 255).toInt();
          final int g = (yValue -
                  (0.337633 * (uValue - 128)) -
                  (0.698001 * (vValue - 128)))
              .clamp(0, 255)
              .toInt();
          final int b =
              (yValue + (1.732446 * (uValue - 128))).clamp(0, 255).toInt();

          final int rgbIndex = 3 * (y * width + x);
          rgbBytes[rgbIndex] = r;
          rgbBytes[rgbIndex + 1] = g;
          rgbBytes[rgbIndex + 2] = b;
        }
      }

      // Encode the RGB byte data to a base64 string
      final base64String = base64Encode(rgbBytes);

      // Create a JSON object with the base64 string and the exercise name
      final jsonString = jsonEncode({
        'image_data': base64String,
        'exercise_name': ref.read(exerciseName),
      });

      // Send the JSON string over the channel
      _channel?.sink.add(jsonString);
    } catch (e) {
      // Log any errors that occur during the process
      log(e.toString());
    }
  }

  Future<List<int>> _convertImageToBytes(CameraImage image) async {
    // Convert the CameraImage to an Image object
    // final imgImage = img.Image.fromBytes(
    //   width: image.planes[0].width ?? SizeUtils.width ~/ 3,
    //   height: image.planes[0].height ?? SizeUtils.height ~/ 3,
    //   bytes: image.planes[0].bytes.buffer,
    // );

    // Convert the Image object to JPEG

    // final jpegBytes = img.encodeJpg(imgImage);
    final imageData = image.planes
        .map((plane) => plane.bytes)
        .expand((element) => element)
        .toList();
    return imageData;
  }

  // Uint8List concatenatePlanes(List<Plane> planes) {
  //   final WriteBuffer allBytes = WriteBuffer();
  //   for (Plane plane in planes) {
  //     allBytes.putUint8List(plane.bytes);
  //   }
  //   return allBytes.done().buffer.asUint8List();
  // }

  @override
  void dispose() {
    _cameraController.dispose();
    _channel?.sink.close(status.goingAway);
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
                // const PoseDetectionPage(),
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
