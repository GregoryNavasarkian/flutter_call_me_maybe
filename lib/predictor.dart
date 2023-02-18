import 'dart:math';
import 'package:flutter/material.dart';

class Predictor extends StatefulWidget {
  const Predictor({super.key});

  @override
  State<Predictor> createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  var rnd = Random();
  var str = [
    'Yes',
    'No',
    'Maybe',
    'Ask Again Later',
    'I don\'t know',
    'I don\'t care',
    'I don\'t think so',
    'I cant be bothered',
  ];
  String answer = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60.0),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              headingText(),
              questionText(),
              answerText(),
            ],
          ),
        ),
      ),
    );
  }

  Padding headingText() => const Padding(
        padding: EdgeInsets.all(5.0),
        child: Text('Call Me... Maybe',
            style: TextStyle(fontFamily: 'Albert', fontSize: 24)),
      );

  Padding questionText() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
            onPressed: () { answer = (str[rnd.nextInt(str.length)]) ; setState(() {}); },
            child: const Text('Ask a question... tap for the answer.',
                style: TextStyle(fontFamily: 'Albert', fontSize: 20))),
      );

  Padding answerText() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(answer,
            style: const TextStyle(fontFamily: 'Albert', fontSize: 24)),
      );
}
