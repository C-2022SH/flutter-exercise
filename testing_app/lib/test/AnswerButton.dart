import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final VoidCallback onClickCallback;
  final String answerText;

  AnswerButton(this.onClickCallback, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: ElevatedButton(
        onPressed: onClickCallback,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
          foregroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text(answerText),
      ),
    );
  }
}
