import 'package:flutter/material.dart';
import 'package:quiz_app/viewmodels/categories_viewmodel.dart';
import '../models/questions_model.dart';
import '../models/quiz_model.dart';
import '../services/quiz_services.dart';

class QuizViewModel with ChangeNotifier {
  final QuizServices quizService;
  CategoriesViewModel categoriesViewModel;
  static List<Question>? questions;
  late Question _currentQuestion;
  int currentQuestionIndex = 0;
  int score = 0;
  int sumScores = 0;
  double scoreIndicator = 0.0;
  int scoreLab = 0;
  int? selectedAnswerIndex;
  Color color = Colors.black26;
  bool isLoading = false;

  static QuizSettings? quizSettings;
  get getQuizSettings => quizSettings;

  QuizViewModel({required this.quizService, required this.categoriesViewModel});

  Future<void> fetchQuestions() async {
    questions = await quizService.fetchQuestions(quizSettings!);
    currentQuestionIndex = 0;
    score = 0;
    scoreLab++;
    print("Questions fetched");
    notifyListeners();
  }

  Question get currentQuestion {
    _currentQuestion = questions![currentQuestionIndex];
    return _currentQuestion;
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions!.length - 1) {
      currentQuestionIndex++;
      print("Next question");
      notifyListeners();
    } else {
      calculateAllScore();
    }
    selectedAnswerIndex = null;
    color = Colors.black26;
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      print("Previous question");
      notifyListeners();
    }
  }

  void submitAnswer(int answerIndex) async {
    if (isLoading) return;
    isLoading = true;
    if (questions![currentQuestionIndex].correctAnswer == questions![currentQuestionIndex].allAnswers?[answerIndex]) {
      score++;
      sumScores++;
    }
    selectedAnswerIndex = answerIndex;
    notifyListeners();
    await changeColor().then((value) {
      nextQuestion();
    });
    isLoading = false;
    notifyListeners();
  }

  void calculateAllScore() {
    scoreIndicator = (sumScores % 10) / 10;
  }

  double calculateCurrentQuizScore() {
    return (1 / int.parse(quizSettings!.amount) * (currentQuestionIndex + 1));
  }

  void updateQuizSettings(String category, String difficulty, String amount) {
    quizSettings = QuizSettings(category: category, difficulty: difficulty, amount: amount);
    notifyListeners();
  }

  Future<void> changeColor() async {
    color = Colors.orange;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2), () {
      color = Colors.black26;
      notifyListeners();
    });
  }
}
