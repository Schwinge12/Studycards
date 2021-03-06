import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/ButtonsAndConstants/LogoutButton.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankKonto.dart';
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
        appBar: AppBar(
        title: Text('Einstellungen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pushNamed(context,'MenuPage');
          },
        ),
        ),
    body: Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: SafeArea(
                      child: Container(
                        height: 200.0,

                        child: Icon(Icons.settings, size: 100,color: Colors.white70),
                      ),
                    ),
                  ),

                  LogoutButton(
                      text: 'Abmelden',
                      onPress: () {
                        //TODO Android zurück Button an handys wirft auf abmelden zurück - bleibt nicht auf menü seite
                        LokaleDatenbankKonto.deleteKonto();
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