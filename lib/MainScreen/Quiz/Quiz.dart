import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/QuizButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/MainScreen/Quiz/QuizAktuelleFrageErgebnis.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/QuizNeu.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/Quizfragen.dart';

class Quiz extends StatefulWidget {
  int anzahlFragen;
  QuizNeu quiz;
  Quiz({@required this.quiz, this.anzahlFragen});
  Random rand = new Random();
  @override
  _Quiz createState() => _Quiz();
}

class _Quiz extends State<Quiz> {

  @override
  Widget build(BuildContext context) {
    Quizfragen frage = widget.quiz.fragenliste[widget.rand.nextInt(widget.quiz.fragenliste.length)];
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
                      frage.getFrage(),
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
                    text: frage.getAntwort(1),
                    onPress: (){
                    },
                    auswertung: istAuswertung(frage.bool1),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  QuizButton(
                    text: frage.getAntwort(2),
                    onPress: (){
                    },
                    auswertung: istAuswertung(frage.bool2),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  QuizButton(
                    text: frage.getAntwort(3),
                    onPress: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>QuizAkutelleFrageErgebnis(frage: frage, quiz: widget.quiz)));
                    },
                    auswertung: istAuswertung(frage.bool3),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  QuizButton(
                    text: frage.getAntwort(4),
                    onPress: (){
                    },
                    auswertung: istAuswertung(frage.bool4),
                  ),
                ],
              ),
        ],
      ),
    );


  }
  bool istAuswertung(int i){
    return (i == 1)? true : false;
  }
}
