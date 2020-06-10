import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/DozentScreens/MCFertigstellen.dart';



class MCErstellen extends StatefulWidget{
  final String studiengang;
  final String studienfach;
  final String themengebiet;

  MCErstellen({this.studiengang,this.studienfach,this.themengebiet});


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
  @override
  Widget build(BuildContext){
    return Scaffold(


      body: SafeArea(
        child: Column(

          children: <Widget>[

            
            Expanded(
              child: SizedBox(
                height: 20,
              ),
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
            SizedBox(

              height: 20,
            ),

            Expanded(
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
            SizedBox(

              height: 20,
            ),
            Expanded(
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
            SizedBox(

              height: 20,
            ),

            Expanded(
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
            SizedBox(

              height: 20,
            ),

            Expanded(
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
            SizedBox(

              height: 20,
            ),


            Expanded(
              flex:2,
              child: SafeArea(
                child: WeiterButton( 
                  text: 'Weiter',
                  onPress: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>
                        MCFertigstellen(frage: frage,antwort1: antwort1,antwort2: antwort2,antwort3: antwort3,antwort4: antwort4,studiengang: widget.studiengang,studienfach: widget.studienfach,themengebiet: widget.themengebiet,)));
                  },
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}