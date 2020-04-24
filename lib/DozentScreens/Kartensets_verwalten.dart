import 'package:flutter/material.dart';
import 'package:karteikartenapp/constants.dart';

class Kartensetsverwalten extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Text('Deine Kartensets')),
        ],
      ),
    );
  }
}