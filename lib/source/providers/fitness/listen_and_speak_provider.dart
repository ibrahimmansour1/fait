import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

final listenAndSpeakProvider =
    ChangeNotifierProvider<ListenAndSpeakNotifier>((ref) {
  return ListenAndSpeakNotifier(ref);
});

class ListenAndSpeakNotifier extends ChangeNotifier {
  Ref ref;
  late FlutterTts flutterTts;
  late stt.SpeechToText speech;
  String recognizedText = "";

  ListenAndSpeakNotifier(this.ref) {
    flutterTts = FlutterTts();
    speech = stt.SpeechToText();
  }

  Future<void> speak(String text, {String language = "en-US"}) async {
    await flutterTts.setLanguage(language);
    await flutterTts.speak(text);
    notifyListeners();
  }

  Future<void> stopSpeak() async {
    await flutterTts.stop();
    notifyListeners();
  }

  Future<void> listen() async {
    stopSpeak();
    if (!speech.isListening) {
      bool available = await speech.initialize(
        onStatus: (val) => debugPrint('onStatus: $val'),
        onError: (val) => debugPrint('onError: $val'),
      );
      if (available) {
        speech.listen(
          pauseFor: const Duration(seconds: 5),
          onResult: (val) {
            recognizedText = val.recognizedWords;
            log("///////////////////////////////////////////");
            log(recognizedText);
            speech.stop();
            notifyListeners();
          },
        );
      } else {
        speech.stop();
        notifyListeners();
      }
    }
  }

  Future<void> stopListen() async {
    await speech.stop();
    notifyListeners();
  }
}
