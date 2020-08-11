import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FittedBox(
                          child: Text(
                            'N '
                            '${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () =>
                            deleteTransaction(transactions[index].id)),
                  ),
                );

                //                return Card(
//                  child: Row(
//                    children: <Widget>[
//                      Container(
//                        child: Text(
//                          'N '
//                          '${transactions[index].amount.toStringAsFixed(2)}',
//                          style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            fontSize: 20,
//                            color: Theme.of(context).primaryColor,
//                          ),
//                        ),
//                        margin: EdgeInsets.symmetric(
//                          vertical: 10,
//                          horizontal: 15,
//                        ),
//                        decoration: BoxDecoration(
//                          border: Border.all(
//                            color: Theme.of(context).primaryColor,
//                            width: 2,
//                          ),
//                        ),
//                        padding: EdgeInsets.all(12),
//                      ),
//                      Container(
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            Text(transactions[index].title,
//                                style: Theme.of(context).textTheme.title),
//                            Text(
//                              DateFormat.yMMMMd()
//                                  .format(transactions[index].date),
//                              style: TextStyle(
//                                fontWeight: FontWeight.bold,
//                                color: Colors.grey,
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
