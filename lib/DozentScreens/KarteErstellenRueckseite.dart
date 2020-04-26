
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenVorderseite.dart';
import 'package:karteikartenapp/FertigstellenButton.dart';
import 'package:karteikartenapp/MultipleChoiceButton.dart';
import 'package:karteikartenapp/WeiterButton.dart';
import 'package:karteikartenapp/constants.dart';
import 'StapelAbschliesenDozent.dart';

//TODO Frontend: Löschen Button einfuegen

class KarteErstellenRueckseite extends StatelessWidget {

  KarteErstellenRueckseite({this.studiengang,this.studienfach,this.themengebiet});

  final String studiengang;
  final String studienfach;
  final String themengebiet;


  final TextEditingController vorderseite= new TextEditingController();
  String eingabe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(studienfach+': '+themengebiet),
        backgroundColor: Colors.blueAccent[400],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: Text('Rückseite:',style: WeisserTextStyle,)),
                  
                  FlatButton(
                    onPressed: (){
                    //TODO Backend: Karte (Vorder & Rückseite) abspeichern
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AbschliessenDozent(studienfach: studienfach,studiengang: studiengang,themengebiet: themengebiet)));
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      color: Colors.white,
                      child: Center(child: Text('Fertig',style: TextStyle(color: Colors.blueAccent,fontFamily: 'Baloobhai2-ExtraBold.ttf', fontSize: 16.0 ) ,)),
                    ),
                  ),
                ],
              ),


              Expanded(
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    style: MenuButtonTextStyle,
                    controller: vorderseite,
                    maxLines: 20,
                    onChanged: (String s){
                      eingabe=s;
                    },
                  ),
                ),

              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[

                  Expanded(
                      child: FlatButton(
                          child: Icon (Icons.add_a_photo, size: 60, color: Colors.white),
                          onPressed: (){
                            //TODO BackEnd: Kamera Zugriff ermöglichen, Datensatz speichern
                          }
                      )

                  ),

                  Expanded(
                    child: MultipleChoiceButton(
                      text: 'MP',
                      onPress: (){

                      },
                    ),
                  ),



                  Expanded(
                    child: WeiterButton(
                      text: 'Weiter',
                      onPress: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenVorderseite(studienfach: studienfach,studiengang: studiengang,themengebiet: themengebiet)));
                      //TODO Backend: Bei jedem Betätigen aktuelle eingaben speichern, und neue eingaben ermöglichen
                      },
                    ),

                  ),


                ],
              ),
            ]),
      ),
    );
  }
}