import 'package:flutter/material.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({
    super.key,
    required this.onRestart,
  });

  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: TextButton.icon(
          onPressed: onRestart,
          label: const Text("Restart Quiz"),
          icon: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
