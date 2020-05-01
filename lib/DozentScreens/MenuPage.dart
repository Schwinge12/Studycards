import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import '../ButtonsAndConstants/MenuButton.dart';


class MenuPage extends StatefulWidget{

  @override
  _MenuPageState createState()=>_MenuPageState();
}

class _MenuPageState extends State<MenuPage>{

  String username='Username';
  String status ='Dozent';

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[400],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

           Icon(Icons.person,size: 150,) ,

              //TODO Backend/Datenbank Username anzeigen lassen
              Text(username,
                style: WeisserTextStyle
                ),

              //TODO Backend/Datenbank Status als Dozent oder Student angeben
              Text(status,
                style:WeisserTextStyle
              ),

            SizedBox(
              height: 50,
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