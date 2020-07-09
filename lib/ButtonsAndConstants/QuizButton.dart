import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'TextStyles.dart';

class QuizButton extends StatefulWidget {


  QuizButton({@required this.text,@required this.auswertung,@required this.onPress,});
  String text;
  bool auswertung;
  Function onPress;

  @override
  _QuizButtonState createState() => new _QuizButtonState();
}

class _QuizButtonState extends State<QuizButton> {

var pressed=true;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        widget.onPress;
        setState(() {
          pressed = !pressed;
        });
      },
      child: Container(
        height: 50,
        width:500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: pressed ? Colors.white70 : Colors.white30,
        ),
        child: Center(
          child: AutoSizeText(
            widget.text,
            textAlign: TextAlign.center,
            style: WeisserTextStyle,
            minFontSize:6,
            maxLines:2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
    }
}
