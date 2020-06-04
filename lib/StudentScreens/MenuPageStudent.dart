import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import '../ButtonsAndConstants/MenuButton.dart';
//TODO Frontend: Einstellungen Seite Coden

class MenuPageStudent extends StatefulWidget{

  @override
  _MenuPageStudentState createState()=>_MenuPageStudentState();
}

class _MenuPageStudentState extends State<MenuPageStudent>{

  String username='Username';
  String status ='Student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: SafeArea(
                    child: Container(
                      height: 200.0,

                      child: Image.asset('images/LogoOhneKreis.PNG'),
                    ),
                  ),
                ),

                //TODO Backend/Datenbank Username anzeigen lassen
                Text(username,
                    style: WeisserTextStyle
                ),
                //TODO Backend/Datenbank Status als Dozent oder Student angeben
                Text(status,
                    style: WeisserTextStyle
                ),

                MenuButton(
                  height: 70.0,
                  text: 'Kartenset Erstellen',
                  onPress: (){
                    Navigator.pushNamed(context, 'StapelErstellen');
                  },
                ),
                MenuButton(
                  height: 70.0,
                  text: 'Meine Sets',
                  onPress: (){
                    Navigator.pushNamed(context, 'AlleStapelAnzeigen');
                  },
                ),
                MenuButton(
                  height: 70.0,
                  text: 'Quiz',
                  onPress: (){
                    Navigator.pushNamed(context, 'Quizauswahl');
                  },
                ),
                MenuButton(
                  height: 70.0,
                  text: 'Einstellungen',
                  onPress: (){
                  },
                ),
              ]
          ),
        )
    );
  }
}