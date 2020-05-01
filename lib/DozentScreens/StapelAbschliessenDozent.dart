import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';
import 'MenuButton.dart';

//TODO Frontend: Seite Scrollbar machen?:D

class StapelAbschliessenDozent extends StatelessWidget {

  //TODO Backend: Kursdaten an vorgefertigten Buttons/Textfeldern einfügen

  StapelAbschliessenDozent({this.kurse});

  final String kurse;
  final String studienfach='Programmieren 2';
  final String themengebiet='Vererbung';
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stapel abschließen'),
        backgroundColor: Colors.blueAccent[400],
      ),
      body: Center(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              //TODO Backend: Stapel hochladen

               Icon(Icons.thumbs_up_down,size: 120,) ,

               //TODO Backend/Datenbank Username anzeigen lassen
               Text(studienfach,
                   style: WeisserTextStyle,
               ),
               //TODO Backend/Datenbank Status als Dozent oder Student angeben
               Text(themengebiet,
                   style:WeisserTextStyle
               ),
               SizedBox(
                 height: 50,
               ),
               MenuButton(
                text: 'Stapel hochladen',
                onPress: (){
                Navigator.pushNamed(context, 'StapelErstellen');
                },
              ),

              //TODO Backend: Stapel aus DB löschen

              MenuButton(
              text: 'Stapel überarbeiten',
              onPress: (){
                Navigator.pushNamed(context, 'StapelUeberarbeiten');
                },
    ),
    ]
    ),
    )));
  }
}