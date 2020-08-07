import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function reset;
  Result({this.resultScore, this.reset});

  String get resulPhrase {
    var resultText = 'you did it!';
    if (resultScore <= 8) {
      resultText = 'you are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'prety likeble!';
    } else if (resultScore <= 16) {
      resultText = ' you are ... strange';
    } else {
      resultText = 'you are so bad';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resulPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: reset,
          )
        ],
      ),
    );
  }
}
