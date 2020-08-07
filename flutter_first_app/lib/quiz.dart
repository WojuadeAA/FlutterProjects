import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          ///questions_map is a list of map i.e its a list then inside the list
          ///there are map values...... so we are accessing each values
          /// with its list index value(0,1,2)  and key index value('questionText' in this case)
          ///
          questions[questionIndex]["questionText"],
        ),
//            ...(questionsListofMaps[_questionIndex]['answer'] as List<String>)
//                .map((answer) {
//              return Answer(_answerQuestion, answer);
//            }).toList()
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
