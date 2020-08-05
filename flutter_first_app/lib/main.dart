import 'package:flutter/material.dart';

//void main() {
//  runApp(MyApp());
//}
//lambda_expression
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  //lambda function
  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print('answer chosen!');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      'what\' your favourite color',
      'what\' your favourite animal',
    ];
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white54,
        appBar: AppBar(
          title: Center(
            child: Text('Demo app'),
          ),
          backgroundColor: Colors.grey[700],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_questions.elementAt(_questionIndex)),
              ),
              RaisedButton(
                child: Center(
                  child: Text('answer 1'),
                ),
                /***
                 * we pass the name of the function we want onPressed to
                 * execute, not the function itself because passing the function itself
                 * means the function is executed simultaneously  with the onPressed function
                 * in other words onPressed wants a function therefore we must give it a function not what a function returns
                 *
                 */
                onPressed: _answerQuestion,
                color: Colors.blue,
              ),
              RaisedButton(
                child: Center(
                  child: Text('answer 2'),
                ),
                //anonymous method with lambda expression
                onPressed: () => (print('answer 2 chosen')),
              ),
              RaisedButton(
                child: Center(
                  child: Text('answer 3'),
                ),
                onPressed: () {
                  print('answer 3 chosen');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
