import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'GradientContainer.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String? activeScreen;

  @override
  void initState() {
    activeScreen = 'start-screen';
    super.initState();
  }

  void startQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: activeScreen == 'start-screen'
            ? GradientContainer(
            startQuiz, const [Colors.purple, Colors.deepPurpleAccent])
            : const QuestionsScreen(),
      ),
    );
  }

}