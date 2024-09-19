class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text; // The question text.
  final List<String> answers; /// The list of answer options.

  /// Get the answer options in a shuffled order.
  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
