import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'constants.dart';

class MultipleChoiceButton extends StatelessWidget{


  MultipleChoiceButton({@ required this.onPress,this.text});

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
                color: Colors.white30,
              borderRadius: BorderRadius.circular(10.0),
            ),

            child: Column(
              children: <Widget>[
                Icon (Icons.format_list_bulleted, size:40, color: Colors.black),
                Text (text,style: TextStyle(color: Colors.black,fontFamily: 'Baloobhai2-ExtraBold.ttf', fontSize: 16.0 )),
              ],
            )
        )
    );

  }
}