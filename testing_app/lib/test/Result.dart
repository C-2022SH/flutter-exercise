import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetCallback;

  Result(this.resultScore, this.resetCallback);

  String get resultPhrase {
    var resultText = "well done!";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: resetCallback,
            child: const Text("restart"),
          ),
        ],
      ),
    );
  }
}
