import 'package:flutter/material.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';




class MCErstellen extends StatefulWidget{

  Stapel stapel;
  final String studiengang;
  final String studienfach;
  final String themengebiet;

  MCErstellen({this.studiengang,this.studienfach,this.themengebiet,@required this.stapel});


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

                        Navigator.pushNamed(context, 'MCErstellen');
                      },
                    ),
                  ),

                  Expanded(
                    child: IconButton(  
                      icon: Icon(Icons.check,color: Colors.white,size: 40.0,),
                      onPressed: (){
                        //TODO Backend: Quizstapel speichern
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
}