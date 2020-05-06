import 'package:flutter/material.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenRueckseite.dart';
import 'package:karteikartenapp/ButtonsAndConstants/WeiterButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MultipleChoiceButton.dart';


//TODO Frontend: Löschen Button einfuegen

class KarteErstellenVorderseite  extends StatelessWidget {

  KarteErstellenVorderseite({this.studiengang,this.studienfach,this.themengebiet});

  final String studiengang;
  final String studienfach;
  final String themengebiet; // doppelter Code



  final TextEditingController vorderseite= new TextEditingController();
  String eingabe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO FrontEnd: Lange Strings passend anzeigen
        title: Text(studienfach+': '+themengebiet),

      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text('VORDERSEITE:\n',style: WeisserTextStyle,)),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: TextField(
                    style: MenuButtonTextStyle,
                    controller: vorderseite,
                    maxLines: 20,
                    onChanged: (String s){
                      eingabe=s;
                    }
                  ),
                ),
              ),


              Row(
                children: <Widget>[

                  Expanded(
                    child: FlatButton(
                      child: Icon (Icons.add_a_photo, size: 60, color: Colors.white30),
                        onPressed: (){
                      //TODO BackEnd: Kamera Zugriff ermöglichen, Datensatz speichern
                      }
                    )

                  ),


                  Expanded(
                      child: MultipleChoiceButton(
                        onPress:(){
                          //TODO FrontEnd: Overlay für multiple Choice-"Schablone"
                          //TODO Backend: Multiple Choice Schablone einfügen
                        },
                        text: 'MC',
                      )
                  ),

                  Expanded(
                    child: WeiterButton(
                      text: 'Weiter',
                      onPress: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenRueckseite(vorderSeite: this )));
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