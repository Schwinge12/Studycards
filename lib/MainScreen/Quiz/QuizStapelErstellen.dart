import 'package:flutter/material.dart';
import 'package:karteikartenapp/MainScreen/Karten/KarteErstellenVorderseite.dart';
import 'package:flutter/cupertino.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';
//TODO Backend: Eingebene Daten abspeichern

class QuizStapelErstellen extends StatefulWidget{
  @override
  _QuizStapelErstellen createState()=>_QuizStapelErstellen();
}
class _QuizStapelErstellen extends State<QuizStapelErstellen> {


  String studienfachEingabe;
  String themengebietEingabe;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pushNamed(context,'MenuPage');
          },
        ),
      ),

      body: Column(

        children: <Widget>[

          Expanded(
            child: SafeArea(
              child: Container(
                height: 200.0,

                child: Image.asset('images/LogoOhneKreis.PNG'),
              ),
            ),
          ),
          TextField(

            textAlign: TextAlign.center,
            onChanged: (value) {
              studienfachEingabe=value;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white30,
              hintText: 'Studienfach eingeben',
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
          SizedBox(

            height: 8.0,
          ),

          TextField(

            textAlign: TextAlign.center,
            onChanged: (value) {
              themengebietEingabe=value;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white30,
              hintText: 'Studienfach eingeben',
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

          SizedBox(

            height: 8.0,
          ),

          SafeArea(
            child: Row(
              children: <Widget>[


                Expanded(
                    child: WeiterButton(
                      text: 'Quiz Erstellen',
                      onPress: () async {
                        if(studienfachEingabe==null||themengebietEingabe==null){

                          showDialog(context: context,
                              builder: (_)=>CupertinoAlertDialog(
                                title: Text('Fehlende Eingaben!'),
                                content: Text('Bitte jede Zeile füllen.'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text('OK'),
                                    onPressed:
                                        (){
                                      Navigator.pop(context);
                                    },
                                  ),

                                ],
                              ),
                              barrierDismissible: false);
                        }
                        else{

                          Navigator.pushNamed(context, 'MCErstellen');
                        }
                      },
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}