import 'dart:math';

import 'package:dio/dio.dart';
import 'package:seustudyassist/aiPage/models/chat_message_model.dart';
import 'package:seustudyassist/aiPage/utils/constants.dart';

class StudyRepo {
  static chatTextgenarationRepo(List<ChatMessageModel> previousMessages) async {
    try {
      Dio dio = Dio();

      final repsonse = await dio.post(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${apikey}",
          data: {
            "contents": previousMessages.map((e) => e.toMap()).toList(),
            "generationConfig": {
              "temperature": 0.9,
              "topK": 1,
              "topP": 1,
              "maxOutputTokens": 2048,
              "stopSequences": []
            },
            "safetySettings": [
              {
                "category": "HARM_CATEGORY_HARASSMENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_HATE_SPEECH",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              }
            ]
          });
      log(repsonse.toString() as num);
    } catch (e) {
      log(e.toString() as num);
    }
  }
}
