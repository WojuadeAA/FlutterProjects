import 'package:flutter/material.dart';
import 'package:woju/anotherpage.dart';
import 'package:woju/newPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage('Flutter Demo Home Page'),
      routes: {
        //its a Map <String, Widget>
        //key               // Function
        NewPage.routeName: (ctx) => NewPage(),
        AnotherPage.routeName: (ctx) => AnotherPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage(this.title);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              Navigator.pushNamed(context, NewPage.routeName);
            },
          )
        ],
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
