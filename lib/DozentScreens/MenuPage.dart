import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import '../ButtonsAndConstants/MenuButton.dart';


class MenuPage extends StatefulWidget{

  @override
  _MenuPageState createState()=>_MenuPageState();
}

class _MenuPageState extends State<MenuPage>{

  String username='Username'; //userdata.getKonto().accountName;
  String status ='Dozent';    //userdata.getKonto().toString();

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
              text: 'Kartenset erstellen',
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