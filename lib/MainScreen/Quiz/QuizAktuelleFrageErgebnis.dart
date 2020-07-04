import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/QuizButtonAuswertung.dart';
import 'package:karteikartenapp/ButtonsAndConstants/QuizButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/MainScreen/Quiz/Quiz.dart';

class QuizAkutelleFrageErgebnis extends StatefulWidget {
  int anzahlKarten;

  QuizAkutelleFrageErgebnis({@required this.anzahlKarten});

  @override
  _QuizAkutelleFrageErgebnis createState() => _QuizAkutelleFrageErgebnis();
}
//Werte aus klasse: Quiz werden komplett übergeben von aktueller frage

class _QuizAkutelleFrageErgebnis extends State<QuizAkutelleFrageErgebnis> {

  String antwort1="";
  String antwort2="";
  String antwort3="";
  String antwort4="";


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

              QuizButtonAuswertung(
               'Frankreich',
                  (){
                    Navigator.pushNamed(context,"Quizende");
                  },
                false,
              ),
            SizedBox(
                height: 5.0,
              ),
              QuizButtonAuswertung(
                  'Italien',
                      (){
                    Navigator.pushNamed(context,"Quizende");
                  },
                  false
              ),
              SizedBox(
                height: 5.0,
              ),
              QuizButtonAuswertung(
                  'Brasilien',
                      (){
                    Navigator.pushNamed(context,"Quizende");
                  },
                  true
              ),
              SizedBox(
                height: 5.0,
              ),
              QuizButtonAuswertung(
              'Portugal',
              (){
                Navigator.pushNamed(context,"Quizende");
                },
                false
              ),
            ],
          ),
        ],
      ),
    );
  }
}
