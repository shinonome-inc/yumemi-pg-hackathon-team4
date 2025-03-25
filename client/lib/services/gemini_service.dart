import 'package:client/constants/prompts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

/// google_generative_aiを用いてGeminiを利用するためのクラス。
class GeminiService {
  GeminiService._();

  static final GeminiService instance = GeminiService._();

  static final _model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: dotenv.env['GEMINI_API_KEY']!,
  );

  /// Geminiを用いてテキストメッセージを生成する。
  Future<String> generateMessage({required String inputText}) async {
    final content = [
      Content.text(Prompts.main),
      Content.text(inputText),
    ];
    final response = await _model.generateContent(content);
    return response.text ?? '';
  }
}
