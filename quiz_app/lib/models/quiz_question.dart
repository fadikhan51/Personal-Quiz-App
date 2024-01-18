class QuizQuestion{
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    List<String> temp = List.from(answers);
    temp.shuffle();
    return temp;
  }
}