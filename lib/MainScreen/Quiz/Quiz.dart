import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/QuizButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/MainScreen/Quiz/QuizAktuelleFrageErgebnis.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/QuizNeu.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/Quizfragen.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MenuButton.dart';

class Quiz extends StatefulWidget {
  int anzahlFragen;
  QuizNeu quiz;
  Random rand;
  int zaehler;
  Function onPressed;
  Quiz({@required this.quiz, this.anzahlFragen,this.rand,this.zaehler});

  @override
  _Quiz createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
  int zaehlerBools=0;

  @override
  Widget build(BuildContext context) {
    Quizfragen frage = widget.quiz.fragenliste[widget.rand.nextInt(widget.quiz.fragenliste.length)];
    widget.quiz.richtigeFragenimQuizInsgesamt=widget.quiz.richtigeFragenimQuizInsgesamt+ 1;
    int alleBools = frage.bool1+frage.bool2+frage.bool3+frage.bool4;


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Quiz',style: WeisserTextStyle,)),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 35),
              onPressed: ()async{

              },
            ),
            IconButton(
                icon: Icon(Icons.home,color: Colors.white, size: 35),
                onPressed:() {
                  Navigator.pushNamed(context, 'MenuPage');
                }
            ),
            IconButton(
               icon: Icon(Icons.arrow_forward,color: Colors.white, size: 35),
                onPressed:() {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>QuizAkutelleFrageErgebnis(frage: frage, quiz: widget.quiz,anzahlFragen: widget.anzahlFragen,zaehler: widget.zaehler)));
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
                  height: 280,
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
                  MenuButton(
                      onPress: (){
                        hochzaehlenBeiMehrerenLoesungen(alleBools, frage.bool1);
                      },
                  text: frage.getAntwort(1),
                  height: 50,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  MenuButton(
                    onPress: (){
                      hochzaehlenBeiMehrerenLoesungen(alleBools, frage.bool2);
                    },
                    text: frage.getAntwort(2),
                  height: 50,),
                  SizedBox(
                    height: 5.0,
                  ),
                  MenuButton(
                    onPress: (){
                      hochzaehlenBeiMehrerenLoesungen(alleBools, frage.bool3);
                    },
                    text: frage.getAntwort(3),
                  height: 50,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  MenuButton(
                    onPress: (){
                      hochzaehlenBeiMehrerenLoesungen(alleBools, frage.bool4);
                    },
                    text: frage.getAntwort(4),
                  height: 50,),
                ],
              ),
        ],
      ),
    );
  }
  bool istAuswertung(int i){
    return (i == 1)? true : false;
  }
  int hochZaehlenRichtigGedrueckteAntworten( int bool)
  {
    int i=0;
    if(bool == 1)
      {
        i=1;
      }
    return i;
  }

  void hochzaehlenBeiMehrerenLoesungen(int alleBools, int bool)
  {
    print(alleBools);
    if(zaehlerBools< alleBools && bool==1){
      zaehlerBools++;
      if(zaehlerBools == alleBools)
        {
          widget.quiz.richtigBeantwortet= widget.quiz.richtigBeantwortet+1;
        }
    }
    if(zaehlerBools==alleBools&& bool==0)
      {
        widget.quiz.richtigBeantwortet= widget.quiz.richtigBeantwortet-1;
      }
    print(zaehlerBools);
  }

}
