import 'package:flutter/material.dart';



class MyCard extends StatelessWidget {
  String Url;

  MyCard({this.Url});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ) ,

      child: Column(
        children: <Widget>[
          ClipRRect(

            child: Image.network(

                this.Url
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft:  Radius.circular(16)


            ) ,

          ),
          ListTile(
            title: Text('Like', style: TextStyle(fontSize:14) ),
            trailing: Text('Share', style: TextStyle(fontSize:14) ),

          ),


        ],
      ),
    )
    ;
  }
}
