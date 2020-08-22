import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DashBoard extends StatelessWidget {
  var connectionStatus = false;
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: GoogleFonts.aBeeZee(
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: tapHandler,
    );
  }

  Widget transactionItem({int amount, String name, DateTime date}) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.pink,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  'N' '$amount',
                ),
              ),
            ),
          ),
          title: Text(name),
          subtitle: Text(
            DateFormat.yMMMMd().format(date),
          ),
          trailing: Chip(label: Text('view'))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: Center(
          child: Text('Dashboard'),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink[900],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                        minRadius: 40,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Name',
                        style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'Email@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildListTile("Profile", Icons.person, () {}),
            buildListTile('Transaction History', Icons.history, () {
              Navigator.of(context).pushNamed('/');
            }),
            SizedBox(
              height: mediaQuery.size.height * .02,
            ),
            Divider(
              color: Colors.black45,
            ),
            buildListTile("Settings", Icons.settings, () {
              Navigator.of(context).pushNamed('/');
            }),
            SizedBox(
              height: mediaQuery.size.height * .4,
            ),
            buildListTile('Log Out', Icons.exit_to_app, () {
              Navigator.of(context).pushNamed('/');
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.17,
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Current Balance',
                        style: GoogleFonts.aBeeZee(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink[900]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'N 10000000000.00',
                        style: GoogleFonts.aBeeZee(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                onTap: () {},
                splashColor: Colors.pink[900],
                child: ListTile(
                  leading: connectionStatus
                      ? Icon(Icons.bluetooth)
                      : Icon(Icons.bluetooth_disabled),
                  title: Center(
                    child: Text(
                      'connection status',
                      style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: connectionStatus
                      ? Center(
                          child: Text(
                            'Connected',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Center(
                          child: Text(
                            'Disconnected',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                ),
              ),
            ),
            Container(
              width: 4400,
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: FlatButton(
                color: Colors.pink[900],
                splashColor: Colors.pink[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Withdraw',
                  style: GoogleFonts.aBeeZee(fontSize: 23, color: Colors.white),
                ),
              ),
            ),
            Text(
              'Transactions',
              style: GoogleFonts.aBeeZee(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              //   height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.5,
              child: Column(
                children: <Widget>[
                  transactionItem(
                      amount: 121, name: 'Account Name', date: DateTime.now()),
                  transactionItem(
                      amount: 121, name: 'Account Name', date: DateTime.now()),
                  transactionItem(
                      amount: 121, name: 'Account Name', date: DateTime.now()),
                  transactionItem(
                      amount: 121, name: 'Account Name', date: DateTime.now()),
                  transactionItem(
                      amount: 121, name: 'Account Name', date: DateTime.now()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
