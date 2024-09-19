import 'package:flutter/material.dart';

/// A blank screen widget. Made for testing making new pages.
class BlankScreen extends StatelessWidget {
  const BlankScreen({
    super.key,
    required this.onRestart,
  });

  final void Function() onRestart; /// Function to run when restarting the quiz.

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: TextButton.icon(
          onPressed: onRestart,
          label: const Text("Restart Quiz"),
          icon: const Icon(Icons.refresh),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
