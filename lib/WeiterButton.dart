import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class WeiterButton extends StatelessWidget{


  WeiterButton({this.onPress,@required this.text}){}

  String text;
  final Function onPress;


  @override
  Widget build(BuildContext context) {
    return FlatButton(

      onPressed: onPress,

      child: Container(

        width: 170.0,
        height: 60.0,
        child: Center(
          child: Text(
            text, style: TextStyle(color: Colors.blueAccent,fontFamily: 'Baloobhai2-ExtraBold.ttf', fontSize: 22),
    ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}