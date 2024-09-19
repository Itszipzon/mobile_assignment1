import 'dart:async';
import 'package:flutter/material.dart';

/// A widget that displays a countdown timer.
class QuizTimer extends StatefulWidget {
  const QuizTimer({
    super.key,
    required this.onTimeElapsed,
    required this.time,
    required this.restartTimer,
  });

  final void Function() onTimeElapsed;
  final int time;
  final bool restartTimer;

  @override
  State<StatefulWidget> createState() => QuizTimerState();
}

/// The state of the quiz timer.
class QuizTimerState extends State<QuizTimer> {
  late int _secondsLeft;
  Timer? _timer;

  /// Restart the timer.
  void restartTimer() {
    setState(() {
      _secondsLeft = widget.time;
    });
    _timer?.cancel();
    startTimer();
  }

  /// Start the timer.
  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_secondsLeft == 0) {
          widget.onTimeElapsed();
          if (widget.restartTimer) {
            restartTimer();
          } else {
            timer.cancel();
          }
        } else {
          setState(() {
            _secondsLeft--;
          });
        }
      },
    );
  }

  /// Cancel the timer when initiating the state.
  @override
  void initState() {
    super.initState();
    _secondsLeft = widget.time;
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_secondsLeft seconds left',
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
