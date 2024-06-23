import 'dart:math';

class QuestionsResponse {
  int? responseCode;
  List<Question>? results;

  QuestionsResponse({required this.responseCode, required this.results});

  QuestionsResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json["response_code"];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Question.fromJson(v));
      });
    }
  }
}

class Question {
  String? type;
  String? difficulty;
  String? category;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;
  List<String>? allAnswers;

  Question({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.allAnswers,
  });

  Question.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    difficulty = json["difficulty"];
    category = json["category"];
    question = removeHtmlEntities(json["question"]);
    correctAnswer = json["correct_answer"];
    incorrectAnswers = List<String>.from(json["incorrect_answers"]);
    allAnswers = _generateAllAnswers().map((e) => removeHtmlEntities(e)).toList();
  }

  List<String> _generateAllAnswers() {
    List<String> allAnswers = List<String>.from(incorrectAnswers ?? []);
    if (correctAnswer != null) {
      allAnswers.add(correctAnswer!);
    }
    allAnswers.shuffle(Random());
    return allAnswers;
  }

  String removeHtmlEntities(String text) {
    RegExp exp = RegExp(r'&.*?;');
    String cleanedText = text.replaceAll(exp, '');
    return cleanedText;
  }
}
