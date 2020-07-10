import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';

class QuizButtonAuswertung extends StatefulWidget {
  String text;
  Function onPress;
  bool auswertung;
  Color farbe;

  QuizButtonAuswertung(String text, Function onPress, bool auswertung) {
    this.text = text;
    this.auswertung = auswertung;
    if (auswertung == true) {
      this.farbe = Colors.green;
    }
    else {
      this.farbe = Colors.red;
    }
  }
  @override
  _QuizButtonAuswertungState createState() => new _QuizButtonAuswertungState();
}
class _QuizButtonAuswertungState extends State<QuizButtonAuswertung> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: widget.onPress,
      child: Container(
        height: 50,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: widget.farbe,
          ),
        child: Center(
          child: AutoSizeText(
            widget.text,
            textAlign: TextAlign.center,
            style: WeisserTextStyle,
            minFontSize: 6,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

