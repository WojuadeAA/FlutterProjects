import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';
import './widgets/chart_bars.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
//
//      print(DateFormat.E().format(weekDay));
//      print(totalSum);
      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Container(
              child: Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: data['Day'],
                  spendingAmount: data['amount'],
                  spendingpercentageofTotal: totalSpending == 0.00
                      ? 0
                      : (data['amount'] as double) / totalSpending,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
