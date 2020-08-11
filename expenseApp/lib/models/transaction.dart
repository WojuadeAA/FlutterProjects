import 'package:flutter/cupertino.dart';

class Transaction {
  //region properties
//Properties
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  //ctors
  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });

//endregion

}
