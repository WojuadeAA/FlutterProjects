import 'package:flutter/material.dart';
import 'package:woju/anotherpage.dart';
import 'package:woju/newPage.dart';

void main() {
  runApp(MyApp());
}
//navigation practice
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.yellow,
                      height: 40,
                      width: 40,
                    ),
                    Padding(padding: EdgeInsets.all(16)),
                    Expanded(
                      child: Container(
                        color: Colors.amber,
                        height: 40.0,
                        width: 40,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        color: Colors.brown,
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          color: Colors.yellow,
                          height: 60,
                          width: 60,
                        ),
                        Padding(padding: EdgeInsets.all(16)),
                        Container(
                          color: Colors.yellow,
                          height: 40,
                          width: 40,
                        ),
                        Padding(padding: EdgeInsets.all(16)),
                        Container(
                          color: Colors.brown,
                          height: 20,
                          width: 20,
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.lightGreen,
                              radius: 100,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: 100.0,
                                    width: 100,
                                    color: Colors.yellow,
                                  ),
                                  Container(
                                    height: 60.0,
                                    width: 60,
                                    color: Colors.amber,
                                  ),
                                  Container(
                                    height: 40.0,
                                    width: 49,
                                    color: Colors.brown,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(),
                        Text('End of the line'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
