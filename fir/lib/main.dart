import 'package:flutter/material.dart';

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
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _name, _email, _phone, _password, _confirmpassword;
  final _formkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[400],
      key: _formkey,
      appBar: AppBar(
        title: Text('Create Contact Page'),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
          // IconButton(icon: Icon(Icons.atm), onPressed: null),
          IconButton(icon: Icon(Icons.camera), onPressed: () {}),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Create Contact',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          icon: Icon(
                            Icons.person,
                            color: Colors.green,
                          )),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          icon: Icon(Icons.email, color: Colors.green)),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: 'phone',
                          icon: Icon(Icons.phone, color: Colors.green)),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      controller: _password,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          icon: Icon(
                            Icons.security,
                            color: Colors.green,
                          )),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      controller: _confirmpassword,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          icon: Icon(
                            Icons.border_color,
                            color: Colors.green,
                          )),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {
                          formValidate(
                            name: _name.text,
                            email: _email.text,
                            phone: _phone.text,
                            password: _password.text,
                            confirmpassword: _confirmpassword.text,
                          );
                        },
                        child: Text('Submit Form'),
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  formValidate({name, email, phone, password, confirmpassword}) {
    if (name.isEmpty) {
      _showsnackbar(message: 'Name cant be empty');
    } else if (email.isEmpty) {
      _showsnackbar(message: 'email cant be empty');
      print('email cannot be empty');
    } else if (phone.isEmpty) {
      _showsnackbar(message: 'phone cant be empty');
      print('phone cannot be empty');
    } else if (password.isEmpty) {
      _showsnackbar(message: ' cant be empty');
      print('pass cannot be empty');
    } else if (confirmpassword != password) {
      _showsnackbar(message: 'Passwords doont match');
      print('Passwords dont match');
    } else if (confirmpassword.toString().length < 8) {
      _showsnackbar(message: ' passwords cant be less than 8 characters');
    } else {
      dialoguebox(name: name);
      _showsnackbar(message: '$name $email $phone $confirmpassword');
      print("$name $email $phone $password $confirmpassword");
    }
  }

  void dialoguebox({String name}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('$name has been verified'),
            title: Text('login succesful'),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'verified',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          );
        });
  }

  void _showsnackbar({String message}) {
    _formkey.currentState.showSnackBar(SnackBar(
      content: GestureDetector(
        onTap: () {},
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
      ),
      duration: (Duration(
        seconds: 4,
      )),
      elevation: 0,
      backgroundColor: Colors.black,
    ));
  }

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();
    _confirmpassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _confirmpassword.dispose();
  }
}
