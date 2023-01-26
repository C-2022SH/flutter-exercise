import 'package:flutter/material.dart';

import 'question.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppSate();
  }
}

class _MyAppSate extends State<_MyApp> {
  int _questionIndex = 0;

  void _onPressButton() {
    setState(() {
      ++_questionIndex;
    });

    print(_questionIndex);
    print("button is pressed");
  }

  @override
  Widget build(BuildContext context) {
    List<String> questions = ["first question", "second question"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("this is my test app"),
        ),
        body: Column(children: [
          Question(
            questions[_questionIndex],
          ),
          ElevatedButton(
            onPressed: _onPressButton,
            child: const Text("this is answer1"),
          ),
          ElevatedButton(
            onPressed: () => print("second button pressed"),
            child: Text("this is answer2"),
          ),
          ElevatedButton(
            onPressed: () {
              print("third button pressed");
            },
            child: Text("this is answer3"),
          ),
        ]),
      ),
    );
  }
}
