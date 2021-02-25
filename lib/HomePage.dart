import 'package:flutter/material.dart';
import 'MyCard.dart';
import 'Picture.dart';

class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,


      appBar: AppBar(
          title: Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,

      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Padding(

          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
          child:


          Container(child:

          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Post(Link: "https://ichef.bbci.co.uk/news/1024/cpsprodpb/151AB/production/_111434468_gettyimages-1143489763.jpg",),
                  ),
                );
              },

              child: MyCard(Url: 'https://ichef.bbci.co.uk/news/1024/cpsprodpb/151AB/production/_111434468_gettyimages-1143489763.jpg'))),


        );

      }),


    );
  }
}