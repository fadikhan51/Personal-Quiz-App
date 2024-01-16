import 'package:flutter/material.dart';
import 'package:quiz_app/CustomText.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer(this.changeState, this.colors, {super.key});

  final void Function() changeState;
  List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
      )),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 300,
              color: const Color.fromRGBO(255, 255, 255, 0.7),
              colorBlendMode: BlendMode.modulate,
            ),
            const SizedBox(
              height: 80,
            ),
            CustomText("Learn Flutter the fun way!", fontSize: 25, color: Colors.white),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(30, 53, 53, 115),
                side: const BorderSide(color: Colors.white), // Set the border color to white
              ),
              onPressed: changeState,
              label: const Text(
                "Start Quiz",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
