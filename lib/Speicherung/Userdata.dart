import 'package:karteikartenapp/Speicherung/Fach.dart';
import 'package:path_provider/path_provider.dart';

import 'Produkt.dart';
import 'Stapel.dart';
import 'Student.dart';
import 'Karteikarte.dart';
import 'Speicherung.dart';

class Userdata extends Speicherung {
  //____________________________________Variables_______________________________

  var _konto;
  List<Karteikarte> karteikarten; // Spericherung der KK in liste ODER
  var _datenSpeicherort;
  List<Kurs> kurse;
  List<Stapel> stapel; // speicherung der KK in Stapel ?

  //____________________________________Constructor_____________________________

  Userdata() {
    _datenSpeicherort = getApplicationDocumentsDirectory();
    this.laden();
  }

  //____________________________________Get/Set_________________________________
  Student getKonto() {
    return _konto;
  }

  Kurs getFachMitString(String x) {
    for (int i = 0; i < kurse.length; i++) {
      if (kurse[i]
              .toString()
              .trim()
              .toLowerCase()
              .compareTo(x.trim().toLowerCase()) ==
          0) return kurse[i]; //optimierung?
    }
    return null;
  }

  //____________________________________Methods_________________________________

  @override
  void einfuegen(dynamic p) {
    switch (p.runtimeType) {
      case Student:
        {
          _konto = p;
        }
        break;

      case Karteikarte:
        {
          // TODO: Duplikate checken? // stapel checken und dort einfuegen - Redundanz... Entschidung folgt
          karteikarten.add(p);
          // call speichern(karteikarten)
        }
        break;
      case Kurs:
        {
          // TODO: Duplikate checken?
          kurse.add(p);
          // call speichern(karteikarten)
        }
        break;
      // add other Products?
    }
  }

  @override
  void bearbeiten(Produkt p) {
    // TODO: Speicherung - implement bearbeiten
  }

  @override
  void laden() {
    // TODO: Speicherung - implement laden
    //data?
    // + load data
    // - create new lists (karteikarten)
  }

  @override
  void loeschen(Produkt p) {
    // TODO: Speicherung - implement loeschen
  }

// TODO: Speicherung - Algorithmen zur Listensuche / abgleich / Threading für laufzeitverbesserung

}
