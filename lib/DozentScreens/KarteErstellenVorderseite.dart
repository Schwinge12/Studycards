import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenRueckseite.dart';
import 'package:karteikartenapp/WeiterButton.dart';
import 'package:karteikartenapp/constants.dart';



class KarteErstellenVorderseite  extends StatelessWidget {

  KarteErstellenVorderseite({this.studiengangstring,this.studienfachstring,this.themengebietstring});

  final String studiengangstring;
  final String studienfachstring;
  final String themengebietstring;


  String dropdownValue = 'One';

  final TextEditingController vorderseite= new TextEditingController();
  String eingabe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO FrontEnd: Lange Strings passend anzeigen
        title: Text(studienfachstring+': '+themengebietstring),
        backgroundColor: Colors.blueAccent[400],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text('VORDERSEITE:',style: WeisserTextStyle,)),
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
                    child: WeiterButton(
                      text: 'Weiter',
                      onPress: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>KarteErstellenRueckseite(studienfach: studienfachstring,studiengang: studiengangstring,themengebiet: themengebietstring)));
                      },
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