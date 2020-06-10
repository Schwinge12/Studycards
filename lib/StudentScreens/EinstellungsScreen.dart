import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/MenuButton.dart';




class EinstellungsScreen extends StatefulWidget{

  @override
  _EinstellungsScreenState createState()=>_EinstellungsScreenState();
}

class _EinstellungsScreenState extends State<EinstellungsScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                MenuButton(
                  text: 'Appdesign anpassen',
                  onPress: (){

                  },
                ),


              ]
          ),
        )
    );
    }
}