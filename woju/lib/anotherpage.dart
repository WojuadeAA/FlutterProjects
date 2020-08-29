import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  static const routeName = '/another-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Form(
                child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    initialValue: 'hello',
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
