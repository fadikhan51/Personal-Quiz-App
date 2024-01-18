import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/CustomText.dart';
import 'package:quiz_app/RoundedText.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key, required this.summaryData});

  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...summaryData.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 5),
                    child: RoundedTextCircle(
                      text: ((data['question_index'] as int) + 1).toString(),
                      backgroundColor: (data['is_correct'] as bool)
                          ? const Color.fromARGB(255, 150, 198, 241)
                          : const Color.fromARGB(255, 249, 133, 241),
                      foregroundColor: const Color.fromARGB(255, 22, 2, 56),
                    ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (data['question'] as String),
                            style: GoogleFonts.dosis(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            (data['user_answer'] as String),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 202, 171, 200),
                            ),
                          ),
                          Text(
                            (data['correct_answer'] as String),
                            style: const TextStyle(
                              color: Color.fromARGB(225, 255, 255, 255),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      )
    );
  }
}
