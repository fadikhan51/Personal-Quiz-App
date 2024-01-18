import 'package:flutter/material.dart';
import 'CustomText.dart';
import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen(this.chooseAnswer, {super.key});

  void Function(String) chooseAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  void changeQuestion(String ans) {
    widget.chooseAnswer(ans);
    setState(() {
      currentQuestion++;
    });
  }

  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.purple, Colors.deepPurpleAccent],
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            questions[currentQuestion].text,
            fontSize: 15,
            color: Colors.white,
          ),
          const SizedBox(height: 15),
          ...questions[currentQuestion].getShuffledAnswers().map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      onPressed: (){
                        changeQuestion(e);
                      },
                      child: CustomText(
                        e,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
