import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../ButtonsAndConstants/MenuButton.dart';
//TODO Frontend: Einstellungen Seite Coden

class MenuPageStudent extends StatefulWidget{

  @override
  _MenuPageStudentState createState()=>_MenuPageStudentState();
}

class _MenuPageStudentState extends State<MenuPageStudent>{
  //Doppelt mit MenuPage ?

  static var _userdata = new Userdata();
  String username= _userdata.getKonto().getUsername();
  String status = _userdata.getKonto().toString();

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


                Text(username,
                    style: WeisserTextStyle
                ),

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