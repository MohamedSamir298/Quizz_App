import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../theme/custom_color.dart';
import '../viewmodels/quiz_viewmodel.dart';
import '../widgets/answer_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewModel>(builder: (context, quizViewModel, _) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Question ${quizViewModel.currentQuestionIndex + 1}',
            style: TextStyle(fontSize: 20.sp),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            )
          ],
        ),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                width: .8.sw,
                child: LinearProgressIndicator(
                  minHeight: 10.h,
                  borderRadius: BorderRadius.circular(40),
                  color: CustomColors.primaryButtonColor,
                  backgroundColor: CustomColors.scoreIndicatorOfQuizScreenBackgroundColor,
                  value: quizViewModel.calculateCurrentQuizScore(),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 0.6.sw,
              width: 0.8.sw,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40), border: Border.all(width: 2, color: CustomColors.smallTextColor)),
              child: Center(
                  child: SizedBox(
                      height: 0.45.sw,
                      width: 0.6.sw,
                      child: AutoSizeText(
                        quizViewModel.currentQuestion.question ?? "can't find question",
                        style: TextStyle(fontSize: 20.sp),
                      ))),
            ),
            SizedBox(
              height: 30.h,
            ),
            ListView.separated(
                itemBuilder: (context, index) {
                  return AnswerWidget(
                    index: index,
                    quizViewModel: quizViewModel,
                  );
                },
                separatorBuilder: (_, index) {
                  return SizedBox(
                    height: 15.h,
                  );
                },
                itemCount: 4,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 30.w)),

            // SizedBox(
            //   height: 15.h,
            // ),
            // Container(
            //   height: 0.16.sw,
            //   width: 0.8.sw,
            //   decoration: BoxDecoration(
            //       color: Colors.black26, borderRadius: BorderRadius.circular(25), border: Border.all(color: CustomColors.smallTextColor)),
            //   child: const Center(child: Text("2")),
            // ),
            // SizedBox(
            //   height: 15.h,
            // ),
            // Container(
            //   height: 0.16.sw,
            //   width: 0.8.sw,
            //   decoration: BoxDecoration(
            //       color: Colors.black26, borderRadius: BorderRadius.circular(25), border: Border.all(color: CustomColors.smallTextColor)),
            //   child: const Center(child: Text("3")),
            // ),
            // SizedBox(
            //   height: 15.h,
            // ),
            // Container(
            //   height: 0.16.sw,
            //   width: 0.8.sw,
            //   decoration: BoxDecoration(
            //       color: Colors.black26, borderRadius: BorderRadius.circular(25), border: Border.all(color: CustomColors.smallTextColor)),
            //   child: const Center(child: Text("4")),
            // ),
            // ListView.builder(itemBuilder:
            // (context, index) {
            //   return Container(
            //     height: 100.h,
            //     width: 100.h,
            //     decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(40),border: Border.all(color: CustomColors.smallTextColor)),
            //     child: Text("$index"),
            //   );
            // },itemCount: 3,)
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       QuestionCard(question: currentQuestion),
            //       SizedBox(height: 20),
            //       ...?currentQuestion.allAnswers?.asMap().entries.map((entry) {
            //         int index = entry.key;
            //         String option = entry.value;
            //         return ElevatedButton(
            //           onPressed: () {
            //             quizViewModel.submitAnswer(index);
            //             if (quizViewModel.currentQuestionIndex >= quizViewModel.questions.length - 1) {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => ResultScreen(score: quizViewModel.score),
            //                 ),
            //               );
            //             }
            //           },
            //           child: Text(option),
            //         );
            //       }).toList(),
            //       SizedBox(height: 20),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           if (quizViewModel.currentQuestionIndex > 0)
            //             ElevatedButton(
            //               onPressed: () {
            //                 quizViewModel.previousQuestion();
            //               },
            //               child: Text('Previous'),
            //             ),
            //           if (quizViewModel.currentQuestionIndex < quizViewModel.questions.length - 1)
            //             ElevatedButton(
            //               onPressed: () {
            //                 quizViewModel.nextQuestion();
            //               },
            //               child: Text('Next'),
            //             ),
            //         ],
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      );
    });
  }
}
