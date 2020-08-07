import 'package:flutter/material.dart';
import 'package:flutter_first_app/result.dart';

import 'quiz.dart';

//void main() {
//  runApp(MyApp());
//}

//lambda_expression
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
//methods
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //region properties
  final _questionsListofMaps = const [
    {
      'questionText': 'what\'s your favourite color',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'what\'s your favourite animal',
      'answers': [
        {'text': 'badger', 'score': 10},
        {'text': 'eagle', 'score': 3},
        {'text': 'lion', 'score': 1},
        {'text': 'snake', 'score': 5},
      ]
    },
    {
      'questionText': 'what\'s your best trait?',
      'answers': [
        {'text': 'courage and bravery', 'score': 5},
        {'text': 'hard-work and patience', 'score': 5},
        {'text': 'wisdom and wit', 'score': 5},
        {'text': 'ambition and leadership', 'score': 5},
      ]
    },
  ];
  var _totalScore = 0;
  var _questionIndex = 0;
//endregion

//region methods

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questionsListofMaps.length) {
      print('we have more questions');
    }

    print('answer chosen!');
    print(_questionIndex);
  }
//endregion

  //region build_method
  @override
  Widget build(BuildContext context) {
    //implementing lists in dart
    var _questions_list = [
      'what\'s your favourite color',
      'what\'s your favourite animal',
    ];

    /**********implementing maps in dart**********
     *
     *
     *
     *
     *List<Map<String, Objects>> questionsListofMap
     * so we have a list of map where every map has a string key and an object value
     */
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Demo app'),
          ),
          backgroundColor: Colors.grey[700],
        ),
        body: _questionIndex < _questionsListofMaps.length
            ? Quiz(
                questions: _questionsListofMaps,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(
                resultScore: _totalScore,
                reset: _resetQuiz,
              ),
      ),
    );
  }
//endregion
}

/******************FINAL VS CONST******************
 * final is a runtime constant value, so we use it for a property that will be initialized at runtime
 *    if you have data where you know it would not change once it has its initial value(which you may or may not know) make it final
 *const is a compile time constant,
 *
 */
