import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app/quiz_app.dart';
import 'package:quiz_app/routing/app_router.dart';
import 'package:quiz_app/utils/http_override_request.dart';

void main() async {
  await Hive.initFlutter();
  HttpOverrides.global = MyHttpOverrides();
  runApp(QuizApp(
    appRouter: AppRouter(),
  ));
}
