import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screen/quiz/quiz_screen.dart';
import 'package:quiz_app/screen/score/Score_screen.dart';
import 'package:quiz_app/screen/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:WelcomeScreen(),
    );
  }
}

