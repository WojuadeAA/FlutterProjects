import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisputeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: Icon(Icons.arrow_back),
      title: Center(child: Text('1AppPOS')),
      backgroundColor: Colors.pink[900],
      actions: <Widget>[
        Icon(
          Icons.home,
          size: 30,
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(),
            Container(
              padding: EdgeInsets.all(30),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
