import 'package:flutter/material.dart';
import 'package:woju/anotherpage.dart';

class NewPage extends StatelessWidget {
  static const routeName = 'NewPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Icon(Icons.error),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              Navigator.popAndPushNamed(context, AnotherPage.routeName);
            },
          )
        ],
      )),
      body: SingleChildScrollView(),
    );
  }
}
