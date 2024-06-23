import 'package:flutter/material.dart';
import 'package:quiz_app/routing/routes.dart';
import 'package:quiz_app/views/home_screen.dart';
import 'package:quiz_app/views/onboarding_screen.dart';
import 'package:quiz_app/views/preferences_choose_screen.dart';
import 'package:quiz_app/views/quiz_screen.dart';
import 'package:quiz_app/views/result_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.preferencesChooseScreen:
        return MaterialPageRoute(builder: (_) => PreferencesChooseScreen());
      case Routes.quizScreen:
        return MaterialPageRoute(builder: (_) => QuizScreen());
      case Routes.resultScreen:
        return MaterialPageRoute(builder: (_) => ResultScreen(score: 12));
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text("No route defined for ${settings.name}"))));
    }
  }
}
