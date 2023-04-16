import 'package:ddm_test/three_demensional_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(ThreeDemensionalTestApp());

class ThreeDemensionalTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Model Viewer")),
        body: ThreeDemensionalModel(),
      ),
    );
  }
}
