import 'package:flutter/material.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenVorderseite.dart';
import 'package:flutter/cupertino.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/Speicherung/Kurs.dart';
import 'package:karteikartenapp/Speicherung/Studiengang.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';

//TODO Backend: Eingebene Daten abspeichern

class StapelErstellen extends StatefulWidget{
  @override
  _StapelErstellen createState()=>_StapelErstellen();
}
class _StapelErstellen extends State<StapelErstellen> {

  String studiengangEingabe;

  String kursEingabe;

  String themengebietEingabe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


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
              studiengangEingabe=value;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white30,
              hintText: 'Studiengang eingeben',
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
              kursEingabe=value;
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
              hintText: 'Themengebiet eingeben',
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

          Row(
            children: <Widget>[
              Expanded(
                child: WeiterButton(
                  text: 'Zurück',
                  onPress: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),

              Expanded(
                  child: WeiterButton(
                    text: 'Speichern',
                    onPress: (){
                      if(kursEingabe==null||studiengangEingabe==null||themengebietEingabe==null){


                        showDialog(context: context,
                            builder: (_)=>CupertinoAlertDialog(
                              title: Text('Fehlende eingaben!'),
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
                        Userdata stapel = new Userdata();
                        Kurs kurs = new Kurs();
                        //Eingaben in Speicherungslisten einspeichern
                        stapel.studiengaenge.add(new Studiengang(studiengangEingabe));
                        stapel.kurse.add(kurs.mitName(kursEingabe));
                        //kurs.themengebiet.add(new Themengebiet(themengebietEingabe));


                        Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenVorderseite(studiengang: studiengangEingabe,studienfach: kursEingabe,themengebiet: themengebietEingabe)));
                      }
                    },
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}