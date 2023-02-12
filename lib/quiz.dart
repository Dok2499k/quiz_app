import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz(this.questions, this.answerQuestion, this.questionIndex,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map(
          (answer) {
            return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
          },
        ).toList()
      ],
    );
  }
}
