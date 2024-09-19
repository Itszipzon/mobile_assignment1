import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

/// The results screen widget.
class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.chosenAnswers,
      required this.onRestart,
      required this.onBlank});

  final void Function() onRestart; /// Function to run when restarting the quiz.
  final void Function() onBlank; /// Function to run when switching to the blank screen.
  final List<String> chosenAnswers; /// The list of answers chosen by the user.

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = []; /// The list of question summaries.

    /// Add the question summaries to the list.
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    /// The message to display based on the number of correct answers.
    String message;
    if (numCorrectQuestions == 6) {
      message = 'You are smart as a Rune';
    } else if (numCorrectQuestions >= 3) {
      message = 'You are atleast better than Avnit';
    } else {
      message = 'You have been a very bad boy';
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$message \n You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
            TextButton.icon(
                onPressed: onBlank,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                label: const Text("Blank Screen")),
          ],
        ),
      ),
    );
  }
}
