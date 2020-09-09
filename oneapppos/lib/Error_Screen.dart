import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Error_Scrren extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            appBar.preferredSize.height) *
                        0.3,
                    width: double.maxFinite,
                    child: Icon(
                      Icons.cancel,
                      size: 100,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            appBar.preferredSize.height) *
                        0.2,
                    child: Text(
                      'ERROR!',
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 40),
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            appBar.preferredSize.height) *
                        0.2,
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      'Oops something went wrong',
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.red),
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            appBar.preferredSize.height) *
                        0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton(
                              color: Colors.red,
                              splashColor: Colors.red[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'OPEN DISPUTE',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            FlatButton(
                              color: Colors.pink[900],
                              splashColor: Colors.green[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Go Home',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
