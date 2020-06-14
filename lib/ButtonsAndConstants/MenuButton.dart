import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';

class MenuButton extends StatelessWidget{

  MenuButton({@required this.text,@required this.onPress,this.height});
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
          child: Text(
            text,
            style: MenuButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(

              color: Colors.white30,
              borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}