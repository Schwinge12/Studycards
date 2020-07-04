import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/QuizButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';

class Quiz extends StatefulWidget {
  int anzahlKarten;

  Quiz({@required this.anzahlKarten});
  @override
  _Quiz createState() => _Quiz();
}

class _Quiz extends State<Quiz> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Quiz',style: WeisserTextStyle,)),
          actions: <Widget>[
            // action button
            IconButton(
                icon: Icon(Icons.home,color: Colors.white, size: 35),
                onPressed:() {
                  Navigator.pushNamed(context, 'MenuPage');
                }
            ),
          ]
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                        offset: Offset(
                          10.0,
                          10.0,
                        ),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 350,
                  width: 200,
                  child: Center(
                    child: AutoSizeText(
                      'Welches ist das Land mit den meisten Einwohnern?',
                      textAlign: TextAlign.center,
                      style: MenuButtonTextStyle,
                      minFontSize: 6,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
              Column(
                children: <Widget>[
                  QuizButton(
                    text: 'Frankreich',
                    onPress: (){
                    },
                    auswertung: false,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  QuizButton(
                    text: 'Italien',
                    onPress: (){
                    },
                    auswertung: false,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  QuizButton(
                    text: 'Brasilien',
                    onPress: (){
                      Navigator.pushNamed(context, 'QuizAktuelleFrageErgebnis');
                    },
                    auswertung: true,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  QuizButton(
                    text: 'Portugal',
                    onPress: (){
                    },
                    auswertung: false,
                  ),
                ],
              ),
        ],
      ),
    );

    bool istAuswertung(bool auswertung){
      return auswertung;
    }
  }
}
