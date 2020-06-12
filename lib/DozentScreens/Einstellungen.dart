import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/LogoutButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../ButtonsAndConstants/MenuButton.dart';


class Einstellungen extends StatefulWidget{

  @override
  _EinstellungenState createState()=>_EinstellungenState();
}

class _EinstellungenState extends State<Einstellungen> {
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

                        child: Icon(Icons.settings, size: 100,),
                      ),
                    ),
                  ),

                  LogoutButton(
                      text: 'Abmelden',
                      onPress: (
                          //TODO DB Firebase Abmelden
                          ) {
                        Navigator.pushNamed(context, 'LoginScreen');
                      }
                  ),

                ],
              ),
            )
        )

    );
  }
}