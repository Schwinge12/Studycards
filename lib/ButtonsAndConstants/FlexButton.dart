import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'TextStyles.dart';

class FlexButton extends StatelessWidget{


  FlexButton({@required this.onPress,@required this.text,this.color,this.style});

  Color color;
  String text;
  final Function onPress;
  TextStyle style;


  @override
  Widget build(BuildContext context) {
    return FlatButton(

      onPressed: onPress,

      child: Container(

        width: 170.0,
        height: 60.0,
        child: Center(
          child: Text(
            text, style: style ?? TextStyle(color: Colors.black,fontFamily: 'Baloobhai2-ExtraBold.ttf', fontSize: 22),
    ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color ??  Colors.white30,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}