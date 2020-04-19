import 'package:flutter/material.dart';
import 'package:karteikartenapp/StapelErstellen.dart';
import 'MenuPage.dart';
import 'StapelErstellen.dart';

void main()=>runApp(KarteikartenApp());

class KarteikartenApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.blueAccent[400]
      ),
      home: MenuPage(),
      routes: {
        'MenuPage':(context)=>MenuPage(),
        'StapelErstellen':(context)=>StapelErstellen(),
      },

    );
  }
}