import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:quiz_app/utils/constants.dart';
import '../models/questions_model.dart';
import 'package:http/http.dart' as http;

import '../models/quiz_model.dart';

class QuizServices {
  String numberOfQuestions = "?amount=";
  String category = "&category=";
  String difficulty = "&difficulty=";

  Future<List<Question>> fetchQuestions(QuizSettings settings) async {
    try {
      final response = await http.get(Uri.parse(getUrl(settings)));
      if (response.statusCode == 200) {
        final List questions = jsonDecode(response.body)["results"];
        return questions.map((item) => Question.fromJson(item)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("error occurred : $e");
      return [];
    }
  }

  String getUrl(QuizSettings settings) {
    String apiUrl = Constants().baseUrl +
        numberOfQuestions +
        settings.amount +
        category +
        settings.category +
        difficulty +
        settings.difficulty +
        Constants().type;
    if (kDebugMode) {
      print(apiUrl);
    }
    return apiUrl;
  }
}
