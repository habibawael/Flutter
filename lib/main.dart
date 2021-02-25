import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'posts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sign In',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();

  bool _validate = false;

  String _email = "";
  String _password = "";

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
      _validate = true;
    } else {
      _password = _passwordFilter.text;
      _validate = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign In"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new TextField(
                      controller: _emailFilter,
                      decoration: new InputDecoration(labelText: 'Email'),
                    ),
                  ),
                  new Container(
                    child: new TextField(
                      controller: _passwordFilter,
                      decoration: new InputDecoration(
                          labelText: 'Password',
                          errorText:
                              _validate ? 'Password can\'t be empty' : null),
                      obscureText: true,
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: new Column(
                children: <Widget>[
                  new RaisedButton(
                    child: new Text('Login'),
                    onPressed: _loginPressed,
                  ),
                  new FlatButton(
                    child: new Text('Need an account? Register.'),
                  ),
                  new FlatButton(
                    child: new Text('Forgot Password?'),
                  ),
                  new RaisedButton(
                    child: new Text('Posts'),
                    onPressed: _postsPressed,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _loginPressed() {
    setState(() {
      _password.characters.isEmpty ? _validate = true : _validate = false;
    });
    if (_validate == false) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }
  }

  void _postsPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return postsPage();
    }));
  }
}
