import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/LogoutButton.dart';
import 'package:karteikartenapp/ButtonsAndConstants/constants.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import '../ButtonsAndConstants/MenuButton.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Einstellungen extends StatefulWidget{

  @override
  _EinstellungenState createState()=>_EinstellungenState();
}

class _EinstellungenState extends State<Einstellungen> {

  final _auth = FirebaseAuth.instance;
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
                      onPress: () {
                        _auth.signOut();

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