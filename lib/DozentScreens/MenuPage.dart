import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../ButtonsAndConstants/MenuButton.dart';


class MenuPage extends StatefulWidget{

  @override
  _MenuPageState createState()=>_MenuPageState();
}

class _MenuPageState extends State<MenuPage>{
  static var _userdata = new Userdata();
  String username= _userdata.getKonto().accountName;
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

              //TODO Backend/Datenbank Username anzeigen lassen
              Text(username,
                style: WeisserTextStyle
                ),
              //TODO Backend/Datenbank Status als Dozent oder Student angeben
              Text(status,
                style:WeisserTextStyle
              ),

            MenuButton(
              text: 'Kartenset Erstellen',
              onPress: (){
                Navigator.pushNamed(context, 'StapelErstellen');
              },
            ),
              MenuButton(
                text: 'Meine Sets',
                onPress: (){
                    Navigator.pushNamed(context, 'AlleStapelAnzeigen');
                },
              ),
              MenuButton(
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