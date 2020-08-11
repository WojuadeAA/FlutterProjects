import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction({this.addtx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
//region properties
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
//endregion
  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
//return stop the function execution i.e addTx is not reached

      return;
    }
    widget.addtx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(labelText: 'Title'),
              //  style: TextStyle(color: Colors.black),

//                    onChanged: (value) {
//                      titleInput = value;
//                    },
              controller: _titleController,
            ),
            TextField(
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(labelText: 'amount'),
              //style: TextStyle(color: Colors.black),

//                    onChanged: (value) {
//                      amountInput = value;
//                    },
              controller: _amountController,
            ),
            Container(
              height: 65,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date chosen!'
                        : 'picked date ${DateFormat.yMMMMd().format(_selectedDate)}'),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'choose date',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                _submitData();
              },
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
