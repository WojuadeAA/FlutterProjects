import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction({this.addtx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
//return stop the function execution i.e addTx is not reached

      return;
    }
    widget.addtx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autocorrect: true,
              autofocus: true,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(labelText: 'Title'),
              //  style: TextStyle(color: Colors.black),

//                    onChanged: (value) {
//                      titleInput = value;
//                    },
              controller: titleController,
            ),
            TextField(
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(labelText: 'amount'),
              //style: TextStyle(color: Colors.black),

//                    onChanged: (value) {
//                      amountInput = value;
//                    },
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: () {
//                      print(titleInput);
//                      print(amountInput);
//                print(titleController.text);
//                print(amountController.text);

                submitData();
              },
              textColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
