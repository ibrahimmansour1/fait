import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:image/image.dart' as imgg;

// Pose Providers
final firstPoseFrames = StateProvider<int>((ref) => 0);
final lastPoseFrames = StateProvider<int>((ref) => 1);
final wrongPoseFrames = StateProvider<int>((ref) => 2);
final lastPose = StateProvider<String>((ref) => "Unknown");
final exerciseName =
    StateProvider<String>((ref) => "Dumbbell Bicep Curl (Reverse Grip)");
final framesCounter = StateProvider<int>((ref) => 0);

final poseDetectionProvider =
    StateNotifierProvider<PoseDetectionStateNotifier, PoseDetectionState>(
  (ref) => PoseDetectionStateNotifier(ref),
);

class PoseDetectionPage extends ConsumerWidget {
  const PoseDetectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(poseDetectionProvider.notifier);

    return InputCameraView(
      cameraDefault: InputCameraType.rear,
      resolutionPreset: ResolutionPreset.low,
      title: 'Pose Detection',
      onImage: (InputImage image) async {
        ref.watch(framesCounter.notifier).update((state) => state++);
        if (ref.watch(framesCounter) % 10 == 0) {
          await state.sendFrame(image.bytes!);
        }
      },
    );
  }
}

class PoseDetectionState {
  InputImage? _image;
  bool _isProcessing = false;

  InputImage? get image => _image;

  String? get type => _image?.type;
  InputImageRotation? get rotation => _image?.metadata?.rotation;
  Size? get size => _image?.metadata?.size;

  bool get isNotProcessing => !_isProcessing;
  bool get isEmpty => _image == null;
  bool get isFromLive => type == 'bytes';
  bool get notFromLive => !isFromLive;

  PoseDetectionState copyWith({
    InputImage? image,
    bool? isProcessing,
  }) {
    return PoseDetectionState()
      .._image = image ?? _image
      .._isProcessing = isProcessing ?? _isProcessing;
  }
}

class PoseDetectionStateNotifier extends StateNotifier<PoseDetectionState> {
  final Ref ref;
  WebSocketChannel? _channel;

  PoseDetectionStateNotifier(this.ref) : super(PoseDetectionState()) {
    _initWebSocket();
  }

  void _initWebSocket() {
    _channel = IOWebSocketChannel.connect(
      Uri.parse('ws://192.168.166.191:6000/joint-processing'),
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

  Future<void> sendFrame(Uint8List image) async {
    try {
      String base64Image = base64Encode(image);
      // final imageData = imgg.decodePng(image);
      _channel?.sink.add(json.encode({
        'image_data': image,
        'exercise_name': ref.read(exerciseName),
      }));
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    _channel?.sink.close();
    super.dispose();
  }
}
