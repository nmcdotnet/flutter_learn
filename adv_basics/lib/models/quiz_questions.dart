class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List<String>.from(answers);
    shuffledAnswers.shuffle(); // trộn các phần tử trong mảng
    return shuffledAnswers;
  }
}
