import 'package:flutter/material.dart';
import 'package:karteikartenapp/DozentScreens/AlleStapelAnzeigen.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenVorderseite.dart';
import 'package:karteikartenapp/DozentScreens/Kartensets_verwalten.dart';
//import 'package:karteikartenapp/DozentScreens/MenuButton.dart';
import 'package:karteikartenapp/DozentScreens/StapelErstellen.dart';
import 'package:karteikartenapp/DozentScreens/MenuPage.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenRueckseite.dart';
import 'package:karteikartenapp/DozentScreens/Kartenabfrage.dart';
import 'package:karteikartenapp/DozentScreens/StapelAbschliessenDozent.dart';
import 'package:karteikartenapp/DozentScreens/StapelUeberarbeiten.dart';

import 'StudentScreens/EinzelnerStapelStatusAnsicht.dart';


void main()=>runApp(KarteikartenApp());

class KarteikartenApp extends StatelessWidget{
//TODO Frontend: AppIcon
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.light(
      ).copyWith(primaryColor: Colors.blueAccent[400],scaffoldBackgroundColor: Colors.blueAccent[400], accentColor: Colors.grey ),

      darkTheme: ThemeData.dark().copyWith(accentColor: Colors.grey ),
      home: MenuPage(),
      routes: {
        'MenuPage':(context)=>MenuPage(),
        'StapelErstellen':(context)=>StapelErstellen(),
        'Kartensets verwalten':(context)=>Kartensetsverwalten(),
        'KarteErstellenVorderseite':(context)=>KarteErstellenVorderseite(),
        'KarteErstellenRueckseite':(context)=>KarteErstellenRueckseite(),
        'Kartenabfrage':(context)=>Kartenabfrage(),
        'StapelAbschliessenDozent':(context)=>StapelAbschliessenDozent(),
        'StapelUeberarbeiten':(context)=>StapelUeberarbeiten(),
        'AlleStapelAnzeigen':(context)=>AlleStapel(),
        'EinzelnerStapelStatus':(context)=>StapelStatus(),
      },

    );
  }
}