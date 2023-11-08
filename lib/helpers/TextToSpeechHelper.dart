import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechHelper {
  static FlutterTts _flutterTts = FlutterTts();
  static bool _isSpeaking = false;

  static Future<void> speak(String text) async {
    await _flutterTts.stop();
    await _flutterTts.setLanguage('pt-BR');
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.speak(text);
    _isSpeaking = true;
  }

  static Future<void> pause() async {
    if (_isSpeaking) {
      await _flutterTts.stop(); // Stop the speech if it is speaking
      _isSpeaking = false;
    }
  }
}
