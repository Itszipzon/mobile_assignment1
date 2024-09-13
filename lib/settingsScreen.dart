import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Set<int> disabledQuestions;
  final void Function(Set<int> updatedDisabledQuestions)
      onUpdateDisabledQuestions;

  const SettingsScreen({
    super.key,
    required this.disabledQuestions,
    required this.onUpdateDisabledQuestions,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Set<int> _localDisabledQuestions;

  @override
  void initState() {
    super.initState();
    _localDisabledQuestions = Set.from(widget.disabledQuestions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(questions[index].text),
            value: _localDisabledQuestions.contains(index),
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  _localDisabledQuestions.add(index);
                } else {
                  _localDisabledQuestions.remove(index);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onUpdateDisabledQuestions(_localDisabledQuestions);
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
