import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/helpers/extentions.dart';
import 'package:quiz_app/routing/routes.dart';
import 'package:quiz_app/theme/custom_color.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../viewmodels/quiz_viewmodel.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: scoreIndicator(),
      ),
      body: Column(
        children: [
          Image.asset("assets/used/home_banner.png"),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.preferencesChooseScreen);
            },
            child: Container(
              height: 80.h,
              width: 80.h,
              decoration: BoxDecoration(
                  color: CustomColors.primaryButtonColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black, width: .5)),
              child: Center(
                child: Text(
                  "Start Quiz",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget scoreIndicator() {
    return Consumer<QuizViewModel>(
      builder: (BuildContext context, QuizViewModel viewModel, Widget? child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: .5.sw,
                    child: LinearProgressIndicator(
                      minHeight: 10.h,
                      borderRadius: BorderRadius.circular(40),
                      color: CustomColors.primaryButtonColor,
                      backgroundColor: Colors.white,
                      value: viewModel.scoreIndicator,
                    ),
                  ),
                ),
                Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: CustomColors.primaryButtonColor),
                    child: Center(
                        child: Text(
                      "${viewModel.scoreLab}",
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                    )))
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${viewModel.sumScores} / ${viewModel.scoreLab * 10}",
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
