import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/WeiterButton.dart';
import 'package:karteikartenapp/constants.dart';


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

              Center(child: Text('Rückseite:',style: WeisserTextStyle,)),

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
                    child: WeiterButton(
                      text: 'Weiter',
                    ),
                  ),


                ],
              ),


              SizedBox(
                height: 15.0,
              ),





            ]),
      ),
    );
  }
}