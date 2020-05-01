import 'package:flutter/material.dart';
import 'package:karteikartenapp/constants.dart';

class MenuButton extends StatelessWidget{


  MenuButton({@required this.text,this.onPress});

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(

      onPressed: onPress,

      child: Container(
        width: 300.0,
        height: 80.0,
        child: Center(
          child: Text(
            text,
            style: MenuButtonTextStyle,

          ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xFF89B3FB),
              borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}