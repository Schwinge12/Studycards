import 'package:flutter/material.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankQuiznamen.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/QuizNeu.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/Quizfragen.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';

class MCErstellen extends StatefulWidget{


  final String studienfach;
  final String themengebiet;

  QuizNeu quiz;
  Userdata _userdata = new Userdata();


  MCErstellen({@required this.studienfach,@required this.themengebiet,@required this.quiz});


  @override
  _MCErstellen createState()=>_MCErstellen();
}

class _MCErstellen extends State <MCErstellen>{

  String frage;
  String antwort1;
  String antwort2;
  String antwort3;
  String antwort4;
  List<String> antworten;

  bool checked1=false;
  bool checked2=false;
  bool checked3=false;
  bool checked4=false;

  @override
  Widget build(BuildContext){
    return Scaffold(

      body: SafeArea(
        child: Column(

          children: <Widget>[

            SizedBox(
              height: 20.0,
            ),


            Expanded(
              child: TextField(

                textAlign: TextAlign.center,
                onChanged: (value) {
                  frage=value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: 'Frage eingeben',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Color(0xFF58A4B0), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF58A4B0), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),



            Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: TextField(

                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      antwort1=value;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white30,
                      hintText: 'Antwort eingeben',
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Color(0xFF58A4B0), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF58A4B0), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Checkbox(
                    checkColor: Colors.green,
                    value: checked1,
                    onChanged: (bool value){
                      setState(() {
                        checked1=value;
                      });
                    },
                  ),
                ),

              ],
            ),

            SizedBox(

              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: TextField(

                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      antwort2=value;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white30,
                      hintText: 'Antwort eingeben',
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Color(0xFF58A4B0), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF58A4B0), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Checkbox(
                    checkColor: Colors.green,
                    value: checked2,
                    onChanged: (bool value){
                      setState(() {
                        checked2=value;
                      });
                    },
                  ),
                ),

              ],
            ),
            SizedBox(

              height: 20,
            ),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: TextField(

                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      antwort3=value;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white30,
                      hintText: 'Antwort eingeben',
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Color(0xFF58A4B0), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF58A4B0), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Checkbox(
                    checkColor: Colors.green,
                    value: checked3,
                    onChanged: (bool value){
                      setState(() {
                        checked3=value;
                      });
                    },
                  ),
                ),

              ],
            ),
            SizedBox(

              height: 20,
            ),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: TextField(

                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      antwort4=value;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white30,
                      hintText: 'Antwort eingeben',
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Color(0xFF58A4B0), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF58A4B0), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Checkbox(
                    checkColor: Colors.green,
                    value: checked4,
                    onChanged: (bool value){
                      setState(() {
                        checked4=value;
                      });
                    },
                  ),
                ),

              ],
            ),
            SizedBox(

              height: 10,
            ),

            SafeArea(
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: IconButton( 
                      icon: Icon(Icons.add,color: Colors.white,size: 40.0,),
                      onPressed: (){
                        widget.quiz.studienfach= widget.studienfach;
                        widget.quiz.themengebiet= widget.themengebiet;
                        frageEinfuegen();
                        Navigator.pushNamed(context, 'MCErstellen');
                      },
                    ),
                  ),

                  Expanded(
                    child: IconButton(  
                      icon: Icon(Icons.check,color: Colors.white,size: 40.0,),
                      onPressed: (){
                        widget.quiz.studienfach= widget.studienfach;
                        widget.quiz.themengebiet= widget.themengebiet;
                        frageEinfuegen();

                        LokaleDatenbankQuiznamen.insertQuiz(widget.quiz);
                        widget._userdata.einfuegen(widget.quiz);
                        LokaleDatenbankQuiznamen.ausgeben();
                        Navigator.pushNamed(context, 'AlleQuizstaplAnzeigen');
                      },
                    ),
                  ),

                ],
              ),
            )




          ],
        ),
      ),
    );
  }
  void frageEinfuegen()
  {
    Quizfragen quizfragen= new Quizfragen();
    quizfragen.frage=frage;
    quizfragen.antwort1=antwort1;
    if (antwort1 == null) quizfragen.bool1 = 2;
    else{(checked1==false)?quizfragen.bool1=0: quizfragen.bool1 = 1;}

    quizfragen.antwort2=antwort2;
    if (antwort2 == null) quizfragen.bool2 = 2;
    else(checked2==false)?quizfragen.bool2=0: quizfragen.bool2 = 1;

    quizfragen.antwort3=antwort3;
    if (antwort3 == null) quizfragen.bool3 = 2;
    else(checked3==false)?quizfragen.bool3=0: quizfragen.bool3 = 1;

    quizfragen.antwort4=antwort4;
    if (antwort4 == null) quizfragen.bool4 = 2;
    else(checked4==false)?quizfragen.bool4=0: quizfragen.bool4 = 1;

    widget.quiz.fragenliste.add(quizfragen);
  }
}