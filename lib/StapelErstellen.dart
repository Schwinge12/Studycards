import 'package:flutter/material.dart';
import 'package:karteikartenapp/MenuButton.dart';
import 'constants.dart';
import 'WeiterButton.dart';
//TODO clippy import löschen
import 'package:clippy_flutter/clippy_flutter.dart';


class StapelErstellen extends StatefulWidget{

  @override
  _StapelErstellen createState()=>_StapelErstellen();

}


class _StapelErstellen extends State<StapelErstellen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],

      ),
      body: Column(
        children: <Widget>[

          SizedBox(
            height: 60.0,
          ),


          TextField(
            style: WeisserTextStyle,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Studiengang eingeben: ',

            ),

          ),

          SizedBox(
            height: 50.0,
          ),

          TextField(
            style: WeisserTextStyle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Studienfach eingeben:',
            ),
          ),

          SizedBox(
            height: 50.0,
          ),

          TextField(
            style: WeisserTextStyle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Themengebiet eingeben:',
            ),
          ),


      Padding(
        padding: const EdgeInsets.fromLTRB(280.0, 160.0, 10.0, 20.0),
        child: WeiterButton(
          onTap: (){
            //TODO KarteErstellen verknüpfen
          },
        ),
      ),

        ],
      ),
    );
  }
}