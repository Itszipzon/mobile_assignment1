import 'package:adv_basics/timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

/// The questions screen widget.
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

/// The state of the questions screen.
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  int questionTime = 10;

  final GlobalKey<QuizTimerState> _timerKey = GlobalKey<QuizTimerState>();

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
        
    if (_timerKey.currentState != null) {
      _timerKey.currentState!.restartTimer();
    }
  }

  void onTimeElapsed() {
    answerQuestion('');
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 201, 153, 251),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ...currentQuestion.shuffledAnswers.map((answer) {
                  return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  );
                })
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: QuizTimer(
              key: _timerKey,
              onTimeElapsed: onTimeElapsed,
              time: questionTime,
              restartTimer: currentQuestionIndex < questions.length - 1,
            ),
          ),
        ),
      ],
    );
  }
}
