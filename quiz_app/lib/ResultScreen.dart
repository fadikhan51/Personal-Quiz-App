import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/SummarySection.dart';

import 'data/questions.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.selectedAnswers, required this.restartFunction});

  List<String> selectedAnswers;
  void Function() restartFunction;

  int correctAns(){
    int count = 0;

    for (int i = 0; i < questions.length; i++) {
      String correctAnswer = questions[i].answers[0]; // First answer is correct

      if (selectedAnswers[i] == correctAnswer) {
        count++;
      }
    }

    return count;
  }

  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary = [];

    for(int i=0; i<questions.length; i++){
      summary.add({
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : selectedAnswers[i],
        'is_correct' : questions[i].answers[0] == selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            Color.fromARGB(255, 210, 35, 66),
            Color.fromARGB(255, 39, 39, 39)

          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered ${correctAns()} out of ${questions.length} questions correctly!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 230, 200, 200),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          SummaryScreen(summaryData: getSummaryData()),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              icon: const Icon(Icons.restart_alt_outlined),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
              ),
              onPressed: restartFunction,
              label: Text("Restart Quiz"))
        ],
      ),
    );
  }
}
