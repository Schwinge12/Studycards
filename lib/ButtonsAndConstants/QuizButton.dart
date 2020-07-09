import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'TextStyles.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/Quizfragen.dart';

class QuizButton extends StatefulWidget {


  QuizButton({@required this.text,@required this.auswertung,@required this.function,this.frage,this.hilf});
  String text;
  bool auswertung;
  Function function;
  Quizfragen frage;
  int hilf;


  @override
  _QuizButtonState createState() => new _QuizButtonState();
}

class _QuizButtonState extends State<QuizButton> {
  var pressed=false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        var function = widget.function;
        setState(() {
          pressed = !pressed;
          widget.auswertung!=widget.auswertung;
        });


      },
      child: Container(
        height: 50,
        width:500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: pressed ? Colors.white30 : Colors.white70,
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