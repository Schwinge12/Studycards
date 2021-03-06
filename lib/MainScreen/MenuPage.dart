import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/TextStyles.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../ButtonsAndConstants/MenuButton.dart';


class MenuPage extends StatefulWidget{


  @override
  _MenuPageState createState()=>_MenuPageState();
}

class _MenuPageState extends State<MenuPage>{

  static var _userdata = new Userdata();
  String username= _userdata.getKonto().getUsername();
  String status = _userdata.getKonto().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: SafeArea(
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


                  AutoSizeText(username,
                      style: WeisserTextStyle
                  ),

                  AutoSizeText(status,
                      style: WeisserTextStyle
                  ),
                  MenuButton(
                    height: 70.0,
                    text: 'Stapel Erstellen',
                    onPress: (){
                      Navigator.pushNamed(context, 'StapelErstellen');
                    },
                  ),
                  MenuButton(
                    height: 70.0,
                    text: 'Meine Stapel',
                    onPress: (){
                      Navigator.pushNamed(context, 'AlleStapelAnzeigen');
                    },
                  ),
                  MenuButton(
                    height: 70.0,
                    text: 'Quiz',
                    onPress: (){
                      Navigator.pushNamed(context, 'AlleQuizstaplAnzeigen');
                    },
                  ),
                  MenuButton(
                    height: 70.0,
                    text: 'Einstellungen',
                    onPress: (){
                      Navigator.pushNamed(context, 'Einstellungen');
                    },
                  ),
                ]
            ),
          ),
        )
    );
  }
}