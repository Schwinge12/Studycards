import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FertigstellenButton extends StatelessWidget{


  FertigstellenButton({this.onPress,this.text});

  String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: Container(
          width: 170.0,
          height: 60.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),

          child: Column(
          children: <Widget>[
           Icon (Icons.check_circle, size:40, color: Colors.blueAccent),
            Text (text,style: TextStyle(color: Colors.blueAccent,fontFamily: 'Baloobhai2-ExtraBold.ttf', fontSize: 16.0 )),
            ],
          )
        )
      );

  }
}