import 'dart:async';
import 'package:flutter/material.dart';

class QuizTimer extends StatefulWidget {
  const QuizTimer({super.key, required this.onTimeElapsed, required this.time, required this.restartTimer});

  final void Function() onTimeElapsed;
  final int time;
  final bool restartTimer;

  @override
  State<StatefulWidget> createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  late int _secondsLeft;

  void restartTimer() {
    setState(() {
      _secondsLeft = widget.time;
    });
  }

  @override
  void initState() {
    super.initState();
    _secondsLeft = widget.time;
    Timer.periodic(
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

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_secondsLeft seconds left',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}