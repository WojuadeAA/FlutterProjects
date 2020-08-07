import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  /**
   * a property
   * Type : Function.
   * Name : selectHandler
    */
  //properties
  Function selectHandler;
  final String answerText;
  //created a constructor that accepts a parameter of type function
  //constructors
  Answer(this.selectHandler, this.answerText);
  /**
   * in a normal language the above ctor will be written as:
   * Answer(Function param){
   * param = selectHandler
   * }
   *
   */

  //methods
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        /***
         * we pass the name of the function we want onPressed to
         * execute, not the function itself because passing the function itself
         * means the function is executed simultaneously  with the onPressed function
         * in other words onPressed wants a function therefore we must give it a function not what a function returns
         *
         */

        onPressed: selectHandler,
      ),
    );
  }
}
