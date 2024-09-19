import 'package:adv_basics/blank_screen.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

/// The main widget for the quiz app.
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

/// The state of the quiz app.
class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';

  /// Switch to the questions screen.
  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  /// Add the selected answer to the list of selected answers.
  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  /// Restart the quiz by resetting the selected answers and switching to the questions screen.
  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }

  /// Switch to the blank screen.
  void blankScreen() {
    setState(() {
      _activeScreen = 'blank-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(_switchScreen);

    /// If the active screen is the questions screen, display the questions screen widget.
    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }

    /// If the active screen is the results screen, display the results screen widget.
    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
        onBlank: blankScreen,
      );
    }

    /// If the active screen is the blank screen, display the blank screen widget.
    if (_activeScreen == 'blank-screen') {
      screenWidget = BlankScreen(
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
