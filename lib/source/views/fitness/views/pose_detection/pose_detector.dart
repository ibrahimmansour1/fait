import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning_pose_detection/learning_pose_detection.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


// Pose Providers
final poseDetectionProvider =
    StateNotifierProvider<PoseDetectionStateNotifier, PoseDetectionState>(
  (ref) => PoseDetectionStateNotifier(ref),
);
final firstPoseFrames = StateProvider<int>((ref) => 0);
final lastPoseFrames = StateProvider<int>((ref) => 1);
final wrongPoseFrames = StateProvider<int>((ref) => 2);
final lastPose = StateProvider<String>((ref) => "Unknown");
final exerciseName = StateProvider<String>((ref) => "Dumbbell Bicep Curl (Reverse Grip)");


class PoseDetectionPage extends ConsumerWidget {
  const PoseDetectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(poseDetectionProvider.notifier);
    final poseState = ref.watch(poseDetectionProvider);


    return InputCameraView(
      cameraDefault: InputCameraType.rear,
      resolutionPreset: ResolutionPreset.low,
      title: 'Pose Detection',
      onImage: (InputImage image) async {
        await state.detectPose(image);
      },
      overlay: poseState.isEmpty
          ? Container()
          : PoseOverlay(
              size: _getOverlaySize(context, poseState),
              originalSize: poseState.size!,
              rotation: poseState.rotation,
              pose: poseState.data!,
            ),
    );
  }

  Size _getOverlaySize(BuildContext context, PoseDetectionState state) {
    Size originalSize = state.size!;
    Size size = MediaQuery.of(context).size;

    // if image source from gallery
    // image display size is scaled to 360x360 with retaining aspect ratio
    if (state.notFromLive) {
      if (originalSize.aspectRatio > 1) {
        size = Size(360.0, 360.0 / originalSize.aspectRatio);
      } else {
        size = Size(360.0 * originalSize.aspectRatio, 360.0);
      }
    }
    return size;
  }
}

class PoseDetectionState {
  InputImage? _image;
  Pose? _data;
  bool _isProcessing = false;

  InputImage? get image => _image;
  Pose? get data => _data;

  String? get type => _image?.type;
  InputImageRotation? get rotation => _image?.metadata?.rotation;
  Size? get size => _image?.metadata?.size;

  bool get isNotProcessing => !_isProcessing;
  bool get isEmpty => _data == null;
  bool get isFromLive => type == 'bytes';
  bool get notFromLive => !isFromLive;

  PoseDetectionState copyWith({
    InputImage? image,
    Pose? data,
    bool? isProcessing,
  }) {
    return PoseDetectionState()
      .._image = image ?? _image
      .._data = data ?? _data
      .._isProcessing = isProcessing ?? _isProcessing;
  }
}

class PoseDetectionStateNotifier extends StateNotifier<PoseDetectionState> {
  final Ref ref;
  WebSocketChannel? _channel;
  bool _shouldDetect = true;

  PoseDetectionStateNotifier(this.ref) : super(PoseDetectionState()) {
    _initWebSocket();
  }

  final PoseDetector _detector = PoseDetector(isStream: true);

  sortLandmarks(Map<PoseLandmarkType, PoseLandmark> landmarks) {
    Map<PoseLandmarkType, PoseLandmark?> sortedLandMarks = {};
    List<PoseLandmarkType> poseLandMarkTypes = [
      PoseLandmarkType.NOSE,
      PoseLandmarkType.LEFT_EYE_INNER,
      PoseLandmarkType.LEFT_EYE,
      PoseLandmarkType.LEFT_EYE_OUTER,
      PoseLandmarkType.RIGHT_EYE_INNER,
      PoseLandmarkType.RIGHT_EYE,
      PoseLandmarkType.RIGHT_EYE_OUTER,
      PoseLandmarkType.LEFT_EAR,
      PoseLandmarkType.RIGHT_EAR,
      PoseLandmarkType.LEFT_MOUTH,
      PoseLandmarkType.RIGHT_MOUTH,
      PoseLandmarkType.LEFT_SHOULDER,
      PoseLandmarkType.RIGHT_SHOULDER,
      PoseLandmarkType.LEFT_ELBOW,
      PoseLandmarkType.RIGHT_ELBOW,
      PoseLandmarkType.LEFT_WRIST,
      PoseLandmarkType.RIGHT_WRIST,
      PoseLandmarkType.LEFT_PINKY,
      PoseLandmarkType.RIGHT_PINKY,
      PoseLandmarkType.LEFT_INDEX,
      PoseLandmarkType.RIGHT_INDEX,
      PoseLandmarkType.LEFT_THUMB,
      PoseLandmarkType.RIGHT_THUMB,
      PoseLandmarkType.LEFT_HIP,
      PoseLandmarkType.RIGHT_HIP,
      PoseLandmarkType.LEFT_KNEE,
      PoseLandmarkType.RIGHT_KNEE,
      PoseLandmarkType.LEFT_ANKLE,
      PoseLandmarkType.RIGHT_ANKLE,
      PoseLandmarkType.LEFT_HEEL,
      PoseLandmarkType.RIGHT_HEEL,
      PoseLandmarkType.LEFT_FOOT_INDEX,
      PoseLandmarkType.RIGHT_FOOT_INDEX
    ];
    for (var i = 0; i < poseLandMarkTypes.length; i++) {
      try {
        sortedLandMarks.addAll({
          poseLandMarkTypes[i]: landmarks[landmarks.keys
              .where((element) => element == poseLandMarkTypes[i])
              .toList()
              .first]
        });
      } catch (e) {
        log(e.toString());
      }
    }

    if (sortedLandMarks.isNotEmpty) {
      var jsonObject = {
        'joints': sortedLandMarks.values
            .map((e) => [e!.position.dx, e.position.dy, e.position.distance])
            .toList(),
        'first_pose_frames': ref.read(firstPoseFrames),
        'last_pose_frames': ref.read(lastPoseFrames),
        'wrong_pose_frames': ref.read(wrongPoseFrames),
        'last_pose': ref.read(lastPose),
        'exercise_name': ref.read(exerciseName),
      };
      _channel?.sink.add(json.encode(jsonObject));
    }
  }

  void _initWebSocket() {
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://192.168.248.133:8000/joint-processing'),
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

  Future<void> detectPose(InputImage image) async {
    if (_shouldDetect && state.isNotProcessing) {
      state = state.copyWith(isProcessing: true);
      state = state.copyWith(image: image);
      final data = await _detector.detect(image);
      state = state.copyWith(data: data, isProcessing: false);
      sortLandmarks(data!.landmarks);
    }

    _shouldDetect = !_shouldDetect;
  }

  @override
  void dispose() {
    _detector.dispose();
    super.dispose();
  }
}
