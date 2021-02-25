import 'package:flutter/material.dart';
import 'HomePage.dart';

class Post extends StatefulWidget {
  String Link;

  Post({this.Link});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white30,
        body: Center(


            child: Column(


                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Container(
                child: new Column(
                children: <Widget>[
                  Image.network(widget.Link),
                new RaisedButton(
                  color: Colors.pinkAccent,
                    child: new Text('Close'),

              onPressed: _closePressed,
        )
    ]
                )
            )
                ]
            )
        )

    );

  }
  void _closePressed () {

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));


  }
}
