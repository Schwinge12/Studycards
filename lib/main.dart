import 'package:flutter/material.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenVorderseite.dart';
import 'package:karteikartenapp/DozentScreens/Kartensets_verwalten.dart';
//import 'package:karteikartenapp/DozentScreens/MenuButton.dart';
import 'package:karteikartenapp/DozentScreens/StapelErstellen.dart';
import 'package:karteikartenapp/DozentScreens/MenuPage.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenRueckseite.dart';
import 'package:karteikartenapp/DozentScreens/Kartenabfrage.dart';



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
        'Kartensets verwalten':(context)=>Kartensetsverwalten(),
        'KarteErstellenVorderseite':(context)=>KarteErstellenVorderseite(),
        'KarteErstellenRueckseite':(context)=>KarteErstellenRueckseite(),
        'Kartenabfrage':(context)=>Kartenabfrage(),
      },

    );
  }
}