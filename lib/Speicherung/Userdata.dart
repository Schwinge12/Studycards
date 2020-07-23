import 'package:flutter/cupertino.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankKarteikarten.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Konten/Dozent.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Kurs.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankQuiznamen.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankStapel.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Studiengang.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Konten/Tutor.dart';
import 'package:path_provider/path_provider.dart';


import 'Produkte/Produkt.dart';
import 'Produkte/Stapel/Stapel.dart';
import 'Produkte/Konten/Student.dart';
import 'Produkte/Stapel/Karteikarte.dart';

import 'Produkte/Quiz/QuizNeu.dart';
// ignore: unnecessary_statements)
class Userdata {
  //____________________________________Variables_______________________________

  static final Userdata _userdata = Userdata._internal(); // singelton
  var _konto;
  List<Karteikarte> karteikarten =
      new List();
  Future<String> get datenspeicherort async {
    final _directory = await getApplicationDocumentsDirectory();

    return _directory.path;
  }
  List<Studiengang> studiengaenge = new List();
  List<Kurs> kurse = new List(); // <-includes List Themengebiete
  List<Stapel> stapel = new List(); // speicherung der KK in Stapel ?
  List<QuizNeu> quiz = new List();

  //____________________________________Constructor_____________________________

  factory Userdata() {
    return _userdata;
  }

  Userdata._internal();

  //____________________________________Get/Set_________________________________
  Student getKonto() {
    return _konto;
  }

  Studiengang getStudiengangVonKontodaten() {
    return getKonto().getStudiengang();
  }

  //____________________________________Methods_________________________________

  @override
  void einfuegen(dynamic p) {
    switch (p.runtimeType) {
      case Student:
      case Tutor:
      case Dozent:
        {
          _konto = p;
          _init();
        }
        break;

      case Stapel:
        {
          stapel.add(p);
        }
        break;
      case Studiengang:
        {
          studiengaenge.add(p);
        }
        break;
      case Kurs:
        {
          kurse.add(p);
        }
        break;
      case QuizNeu:
        {
          quiz.add(p);
        }

    break;
    default: throw new FlutterError('Nicht Implementiert!');
    }
  }
  @override
  void loeschen(Produkt p) {
    switch (p.runtimeType) {
      case Student:
      case Tutor:
      case Dozent:
        {
          _konto = null;
        }
        break;
      case Stapel:
        {
          // nur für default stapel ...
          stapel.remove(p);

        }
        break;
      case Studiengang:
        {
          studiengaenge.remove(p);
        }
        break;
      case Kurs:
        {
          kurse.remove(p);
        }
        break;
      case QuizNeu:
        {
          quiz.remove(p);
        }

        break;
      default: throw new FlutterError('Nicht Implementiert!');
    }
  }

  @override
  void _init() {
    // Testdaten ____________________________
    LokaleDatenbankStapel.alleStapelLaden();
    LokaleDatenbankQuiznamen.alleQuizeLaden();
    // TODO: Speicherung - implement laden
   kkStringListTest();
  }



// TODO: Speicherung - Algorithmen zur Listensuche / abgleich / Threading für laufzeitverbesserung
  Produkt sucheInListe(List l, String s) {
    for (int i = 0; i < l.length; i++) {
      if (l[i]
              .toString()
              .trim()
              .toLowerCase()
              .compareTo(s.trim().toLowerCase()) ==
          0) return l[i];
    }
    return null;
  }

  Future<void> kkStringListTest() async {
    Karteikarte k = new Karteikarte().mitVorderSeite('vorderSe o!ite').mitRueckSeite('rueckAs Seite').mitThemengebiet('themedddngebiet').mitAnswer(1);
    print ( '\n _____KarteikareteToStringListTest_____________');
    print (LokaleDatenbankKarteiKarten.kkToStringList(k));
    Karteikarte kart = await Karteikarte.KKfromMapObject(LokaleDatenbankKarteiKarten.rowFromStringList(LokaleDatenbankKarteiKarten.kkToStringList(k)));
    print(kart.getRueckSeite());
    print(kart.getVorderSeite());
    print(kart.answeredTrue);
    print ('_____/KarteikareteToStringListTest_____________');
  }


}
