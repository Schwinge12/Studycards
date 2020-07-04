import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';

class QuizButton extends StatelessWidget{

  QuizButton({@required this.text,@required this.onPress,@required this.auswertung});
  final String text;
  final Function onPress;
  final bool auswertung;


  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: Container(
        height: 50,
        width:500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white30,
        ),
        child: Center(
          child: AutoSizeText(
            text,
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


