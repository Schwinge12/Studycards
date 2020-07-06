import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/QuizButtonAuswertung.dart';
import 'package:karteikartenapp/ButtonsAndConstants/QuizButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/MainScreen/Quiz/Quiz.dart';
import 'package:karteikartenapp/MainScreen/Quiz/QuizStart.dart';
import 'package:karteikartenapp/MainScreen/Quiz/Quizende.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/QuizNeu.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/Quizfragen.dart';

class QuizAkutelleFrageErgebnis extends StatefulWidget {
  Quizfragen frage;
  QuizNeu quiz;
  QuizAkutelleFrageErgebnis({@required this.frage, this.quiz});

  @override
  _QuizAkutelleFrageErgebnis createState() => _QuizAkutelleFrageErgebnis();
}
//Werte aus klasse: Quiz werden komplett übergeben von aktueller frage

class _QuizAkutelleFrageErgebnis extends State<QuizAkutelleFrageErgebnis> {

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
            IconButton(
              icon: Icon(Icons.check_circle, color: Colors.green, size: 35),
              onPressed:(){
                Navigator.pushNamed(context, 'Quizende');
              }
            )
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
                        color: Colors.transparent,
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
                      widget.frage.getFrage(),
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

              QuizButtonAuswertung(
                widget.frage.getAntwort(1),
                  (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Quizende(quiz: widget.quiz)));
                  },
                   istAuswertung(widget.frage.bool1),        // 0 Falsch, 1 Richtig, 2 Neutral -> falls neutral eingefügt einfach nur frage.bool1 verwenden
              ),
            SizedBox(
                height: 5.0,
              ),
              QuizButtonAuswertung(
                  widget.frage.getAntwort(2),
                      (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Quizende(quiz: widget.quiz)));
                  },
                  istAuswertung(widget.frage.bool2)
              ),
              SizedBox(
                height: 5.0,
              ),
              QuizButtonAuswertung(
                  widget.frage.getAntwort(3),
                      (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Quizende(quiz: widget.quiz)));
                  },
                  istAuswertung(widget.frage.bool3)
              ),
              SizedBox(
                height: 5.0,
              ),
              QuizButtonAuswertung(
                  widget.frage.getAntwort(4),
              (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Quizende(quiz: widget.quiz)));
                },
                  istAuswertung(widget.frage.bool4)
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
