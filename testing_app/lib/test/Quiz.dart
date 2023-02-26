import 'package:flutter/material.dart';

import '../test/Question.dart';
import '../test/AnswerButton.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function onPressButton;
  final int questionIndex;

  const Quiz(
    this.questions,
    this.onPressButton,
    this.questionIndex,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(
        questions[questionIndex]["question"] as String,
      ),
      ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
          .map((answer) {
        return AnswerButton(
          () => onPressButton(answer["score"] as int),
          answer["text"] as String,
        );
      }).toList()
    ]);
  }
}
