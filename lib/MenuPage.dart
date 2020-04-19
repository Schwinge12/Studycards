import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/constants.dart';
import 'MenuButton.dart';


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


              //TODO Username anzeigen lassen
              Text(username,
                style: WeisserTextStyle
                ),



              //TODO Status als Dozent oder Student angeben
              Text(status,
                style:WeisserTextStyle
              ),


            SizedBox(
              height: 50,
            ),

            MenuButton(
              text: 'Stapel erstellen',
              onPress: (){
                Navigator.pushNamed(context, 'StapelErstellen');
              },
            ),

              MenuButton(
                text: 'Meine Stapel',
                onPress: (){

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