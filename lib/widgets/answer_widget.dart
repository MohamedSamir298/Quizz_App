import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/viewmodels/quiz_viewmodel.dart';

import '../theme/custom_color.dart';
import '../views/result_screen.dart';

class AnswerWidget extends StatefulWidget {
  int index;
  QuizViewModel quizViewModel;
  AnswerWidget({super.key, required this.index, required this.quizViewModel});

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.quizViewModel.currentQuestionIndex >= int.parse(widget.quizViewModel.getQuizSettings.amount) - 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(score: widget.quizViewModel.score),
            ),
          );
        }
        widget.quizViewModel.submitAnswer(widget.index);
      },
      child: Container(
        height: 0.16.sw,
        width: 0.8.sw,
        decoration: BoxDecoration(
            color: widget.quizViewModel.selectedAnswerIndex == widget.index ? widget.quizViewModel.color : Colors.black26,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: CustomColors.smallTextColor)),
        child: Center(child: AutoSizeText("${widget.quizViewModel.currentQuestion.allAnswers?[widget.index]}")),
      ),
    );
  }
}
