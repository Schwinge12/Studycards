import 'package:flutter/material.dart';
import 'package:karteikartenapp/DozentScreens/AlleStapelAnzeigen.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenVorderseite.dart';
import 'package:karteikartenapp/DozentScreens/Kartensets_verwalten.dart';
import 'package:karteikartenapp/DozentScreens/StapelErstellen.dart';
import 'package:karteikartenapp/DozentScreens/MenuPage.dart';
import 'package:karteikartenapp/DozentScreens/KarteErstellenRueckseite.dart';
import 'package:karteikartenapp/DozentScreens/Kartenabfrage.dart';
import 'package:karteikartenapp/DozentScreens/StapelAbschliessenDozent.dart';
import 'package:karteikartenapp/DozentScreens/StapelUeberarbeiten.dart';
import 'package:karteikartenapp/StudentScreens/Quizauswahl.dart';
import 'StudentScreens/EinzelnerStapelStatusAnsicht.dart';
import 'Login_Registration/RegistrationScreen.dart';
import 'Login_Registration/LoginScreen.dart';
import 'StudentScreens/MenuPageStudent.dart';
import 'StudentScreens/QuizStart.dart';
import 'StudentScreens/Quiz.dart';
import 'DozentScreens/MCErstellen.dart';
import 'DozentScreens/MCFertigstellen.dart';
import 'DozentScreens/Einstellungen.dart';
import 'package:syncfusion_flutter_core/core.dart';


void main(){
  SyncfusionLicense.registerLicense("NT8mJyc2IWhia31ifWN9ZmFoZHxgfGFjYWNzZGliZWlnZnMSHmg+Mis6Pjo/OjI9fTchNiAwOzYhEyAnJjc2PSd9NTskIH03Ng==");
  return runApp(KarteikartenApp());
}

class KarteikartenApp extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.light(
      ).copyWith(primaryColor: Color(0xFF3E7882),scaffoldBackgroundColor: Color(0xFF58A4B0), accentColor: Colors.grey ),

      darkTheme: ThemeData.dark().copyWith(accentColor: Colors.grey ),
      home: LoginScreen(),
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
        'LoginScreen':(context)=>LoginScreen(),
        'RegistrationScreen':(context)=>RegistrationScreen(),
        'MenuPageStudent':(context)=>MenuPageStudent(),
        'Quizauswahl':(context)=>QuizAuswahl(),
        'Quizstart':(context)=>QuizStart(),
        'Quiz':(context)=>Quiz(),
        'MCErstellen':(context)=>MCErstellen(),
        'MCFertigstellen':(context)=>MCFertigstellen(),
        'LoginScreen':(context)=>LoginScreen(),
        'Einstellungen':(context)=>Einstellungen(),
      },
    );
  }
}