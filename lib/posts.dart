import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class postsPage extends StatefulWidget {
  postsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _postPageState createState() => _postPageState();
}

class _postPageState extends State<postsPage> {
  Future<List<User>> _getUsers() async {
    var data = await http.get('https://jsonplaceholder.typicode.com/posts');

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u['userId'], u['id'], u['title'], u['body']);

      users.add(user);
    }

    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
          backgroundColor: Colors.pinkAccent,
        ),
        backgroundColor: Colors.white70,
        body: Container(
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text(
                      'Loading Please Wait...',
                      style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(snapshot.data[index].title),
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                      );
                    });
              }
            },
          ),
        ));
  }
}

class DetailPage extends StatelessWidget {
  final User post;

  DetailPage(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      backgroundColor: Colors.amber,
      body: Container(
          child: Center(
              child: ListTile(
        title: Text(post.body),
      ))),
    );
  }
}

class User {
  final int userId;
  final int id;

  final String title;
  final String body;

  User(this.userId, this.id, this.title, this.body);
}
