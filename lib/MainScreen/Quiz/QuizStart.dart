
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/ButtonsAndConstants/FlexButton.dart';
import 'package:karteikartenapp/MainScreen/Quiz/AlleQuizStapelAnzeigen.dart';
import 'package:karteikartenapp/MainScreen/Quiz/MCErstellen.dart';
import 'package:karteikartenapp/MainScreen/Quiz/Quiz.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankQuiznamen.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/QuizNeu.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';

class QuizStart extends StatefulWidget{
  QuizNeu quiz;


  QuizStart({@required this.quiz});
  @override
  _QuizStartState createState()=>_QuizStartState();
}

class _QuizStartState extends State<QuizStart>{


  //Todo Backend: anazhl der Karten die Im Quiz sind ändern
  Userdata userdata = new Userdata();

  int auswahl=0;
  Random rand = new Random();
  int hilf;

  @override
  Widget build(BuildContext context) {
    widget.quiz.richtigBeantwortet =0;
    widget.quiz.richtigeFragenimQuizInsgesamt=0;
    int anzahlFragenImQuiz= widget.quiz.fragenliste.length;

    return Scaffold(
      appBar: AppBar(
          title: Center(child: AutoSizeText(
            widget.quiz.themengebiet,
            minFontSize: 6,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>MCErstellen(quiz: widget.quiz,studienfach: widget.quiz.studienfach,themengebiet: widget.quiz.themengebiet,)));
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 35),
              onPressed: ()async{
                showDialog(
                    context: context,
                    builder: (_) =>
                        CupertinoAlertDialog(
                          content:
                          Text(
                              'Soll das akutelle Quiz gelöscht werden?'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text('Quiz löschen'),
                              onPressed: () async {
                                await _loeschen();
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>AlleQuizStapelAnzeigen()));
                              },
                            ),
                          ],
                        ),
                    barrierDismissible: true);
              },
            ),
            IconButton(
                icon: Icon(Icons.share,color: Colors.white, size: 35),
                onPressed:() {
                  //ShareExtend.shareMultiple(widget.stapel.stapelKarten, "Hier ist ein Stapel für dich",subject: widget.stapel.getThemengebietName());
                }
            ),
          ]
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 20.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
              offset: Offset(
                10.0, // horizontal, move right 10
                10.0, // vertical, move down 10
              ),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(

          children: <Widget>[

            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Text('Wie viele Fragen willst du lernen?',style: MenuButtonTextStyle,),
                ),
              ),
            ),

            Text(auswahl.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Colors.black)),

            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.red,
                  thumbShape:
                  RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayShape:
                  RoundSliderOverlayShape(overlayRadius: 20.0),
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                ),
                child: Slider(
                  value: auswahl.toDouble(),
                  min: 0,
                  max: anzahlFragenImQuiz.toDouble(),
                  onChanged: (double newValue) {
                    setState(() {

                      auswahl = newValue.round();
                    });
                  },
                ),
              ),
            ),


            Expanded(
              child: FlexButton(
                color: Colors.green,
                style: WeisserTextStyle,
                text: 'Quiz starten!',
                onPress: (){
                  if (auswahl> 0)
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Quiz(quiz: widget.quiz,anzahlFragen: auswahl, rand: rand,zaehler: 1,richtigbeantwortet: 0,)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _loeschen() async{
    await LokaleDatenbankQuiznamen.stapelLoeschen(widget.quiz);
    await userdata.loeschen(widget.quiz);
  }
}