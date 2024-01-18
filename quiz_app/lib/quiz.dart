import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'GradientContainer.dart';
import 'ResultScreen.dart';
import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = 'start-screen';
    super.initState();
  }

  void startQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    print(answer);
    if(selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: activeScreen == 'start-screen'
            ? GradientContainer(
                startQuiz, const [Colors.purple, Colors.deepPurpleAccent])
            : activeScreen == 'result-screen'
                ? ResultScreen(selectedAnswers: selectedAnswers, restartFunction: startQuiz)
                : QuestionsScreen(chooseAnswer),
      ),
    );
  }
}
