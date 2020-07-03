import 'package:flutter/material.dart';
import 'package:karteikartenapp/MainScreen/Quiz/AlleQuizStapelAnzeigen.dart';
import 'package:karteikartenapp/MainScreen/Quiz/QuizStapelErstellen.dart';
import 'package:karteikartenapp/MainScreen/Stapel/AlleStapelAnzeigen.dart';
import 'package:karteikartenapp/MainScreen/Karten/KarteErstellenVorderseite.dart';
import 'package:karteikartenapp/MainScreen/Stapel/StapelVerwalten.dart';
import 'package:karteikartenapp/MainScreen/Stapel/StapelErstellen.dart';
import 'package:karteikartenapp/MainScreen/MenuPage.dart';
import 'package:karteikartenapp/MainScreen/Karten/KarteErstellenRueckseite.dart';
import 'package:karteikartenapp/MainScreen/Karten/Kartenabfrage.dart';
import 'package:karteikartenapp/MainScreen/Stapel/StapelAbschliessen.dart';
import 'package:karteikartenapp/MainScreen/Stapel/StapelUeberarbeiten.dart';
import 'package:karteikartenapp/MainScreen/Einstellungen.dart';
import 'Login_Registration/PasswortVergessenScreen.dart';
import 'MainScreen/Stapel/EinzelnerStapelStatusAnsicht.dart';
import 'Login_Registration/RegistrationScreen.dart';
import 'Login_Registration/LoginScreen.dart';
import 'MainScreen/MenuPage.dart';
import 'MainScreen/Quiz/QuizStart.dart';
import 'MainScreen/Quiz/Quiz.dart';
import 'MainScreen/Quiz/MCErstellen.dart';
import 'MainScreen/Einstellungen.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:karteikartenapp/MainScreen/Stapel/StapelUeberarbeiten.dart';
import 'MainScreen/Quiz/AlleQuizStapelAnzeigen.dart';
import 'MainScreen/Quiz/QuizStapelErstellen.dart';
void main(){
  SyncfusionLicense.registerLicense("NT8mJyc2IWhia31ifWN9ZmFoZHxgfGFjYWNzZGliZWlnZnMSHmg+Mis6Pjo/OjI9fTchNiAwOzYhEyAnJjc2PSd9NTskIH03Ng==");
  return runApp(KarteikartenApp());
}

class KarteikartenApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.light(
      ).copyWith(primaryColor: Color(0xFF3E7882),scaffoldBackgroundColor: Color(0xFF3E7882), accentColor: Colors.grey ),

      darkTheme: ThemeData.dark().copyWith(accentColor: Colors.grey ),
      home: LoginScreen(),
      routes: {
        'MenuPage':(context) =>MenuPageStudent(),
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
        'Quizstart':(context)=>QuizStart(),
        'Quiz':(context)=>Quiz(),
        'MCErstellen':(context)=>MCErstellen(),
        'LoginScreen':(context)=>LoginScreen(),
        'Einstellungen':(context)=>Einstellungen(),
        'PasswortVergessenScreen':(context)=>PasswortVergessenScreen(),
        'StapelUeberarbeiten':(context)=>StapelUeberarbeiten(),
        'AlleQuizstaplAnzeigen':(context)=>AlleQuizStapelStapel(),
        'QuizStapelErstellen':(context)=>QuizStapelErstellen(),
      },
    );
  }
}