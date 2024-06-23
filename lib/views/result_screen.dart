import 'package:flutter/material.dart';
import 'package:quiz_app/helpers/extentions.dart';
import 'package:quiz_app/routing/routes.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '$score',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.homeScreen, predicate: (Route<dynamic> route) {
                  return false;
                });
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
