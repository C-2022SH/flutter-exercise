import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String textQuestion;

  Question(this.textQuestion);

  @override
  Widget build(BuildContext context) {
    return Text(textQuestion);
  }
}
