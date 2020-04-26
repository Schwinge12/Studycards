import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karteikartenapp/constants.dart';
import 'MenuButton.dart';

//TODO Frontend: Seite Scrollbar machen?:D
class AbschliessenDozent extends StatelessWidget{

  AbschliessenDozent({this.studiengang,this.studienfach,this.themengebiet}){}

  final String studiengang;
  final String studienfach;
  final String themengebiet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[400],
        ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MenuButton(
            text: studiengang+'\n'+studienfach+'\n'+themengebiet,
            onPress: (){

            },
          ),
        ],
      )
    );

  }
}