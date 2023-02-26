import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String textQuestion;

  const Question(this.textQuestion);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        textQuestion,
        style: const TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}
