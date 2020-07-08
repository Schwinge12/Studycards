import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';

class LogoutButton extends StatelessWidget{

  LogoutButton({@required this.text,this.onPress,this.height});

  final double height;
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: Container(
        width: 300.0,
        height: height??80.0,
        child: Center(
          child: AutoSizeText(
            text,
            style: MenuButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(

          color: Colors.white30,
          borderRadius: BorderRadius.circular(10.0),
        ),
      )
    );
  }
}