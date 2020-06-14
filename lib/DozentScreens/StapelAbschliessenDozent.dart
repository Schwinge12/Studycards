import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../ButtonsAndConstants/constants.dart';
import '../ButtonsAndConstants/MenuButton.dart';



class StapelAbschliessenDozent extends StatelessWidget {

  //TODO Backend: Kursdaten an vorgefertigten Buttons/Textfeldern einfügen

  StapelAbschliessenDozent({this.kurse});
  var _userdata = new Userdata();
  final String kurse;
  final String studienfach='Programmieren 2';
  final String themengebiet='Vererbung';
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stapel abschließen'),
      ),
      body: Center(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              //TODO Backend: Stapel hochladen

               Expanded(
                 child: SafeArea(
                   child: Container(
                     height: 200.0,

                     child: Image.asset('images/LogoOhneKreis.PNG'),
                   ),
                 ),
               ),


               Text(_userdata.getKonto().accountName,
                   style: WeisserTextStyle,
               ),


               Text(_userdata.getKonto().toString(),
                   style:WeisserTextStyle
               ),
               SizedBox(
                 height: 50,
               ),
               MenuButton(
                text: 'Stapel hochladen',
                onPress: (){
                //TODO Backend: Stapel hochladen
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