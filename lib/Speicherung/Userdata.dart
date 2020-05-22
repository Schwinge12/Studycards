import 'package:karteikartenapp/Speicherung/StudienKurs.dart';
import 'package:karteikartenapp/Speicherung/Studiengang.dart';
import 'package:path_provider/path_provider.dart';

import 'Produkt.dart';
import 'Stapel.dart';
import 'Student.dart';
import 'Karteikarte.dart';
import 'Speicherung.dart';

class Userdata extends Speicherung {

  //____________________________________Variables_______________________________

  static final Userdata _userdata= Userdata._internal(); // singelton
  var _konto;
  List<Karteikarte> karteikarten; // Spericherung der KK in liste ODER
  var _datenSpeicherort;
  List<StudienKurs> kurse;
  List<Studiengang> studiengaenge;
  List<Stapel> stapel; // speicherung der KK in Stapel ?

  //____________________________________Constructor_____________________________

  factory Userdata(){
    return _userdata;
  }
  Userdata._internal() {
    _userdata._datenSpeicherort = getApplicationDocumentsDirectory();
    _userdata.init();
  }

  //____________________________________Get/Set_________________________________
  Student getKonto() {
    return _konto;
  }

  // doppelter Code ?
  StudienKurs getKursMitString(String s) {
    Produkt tmp = sucheInListe(kurse, s);
    if (tmp == null) {
      StudienKurs tmpKurs = new StudienKurs(s);
      kurse.add(tmpKurs);
      return tmpKurs;
    } else
      return tmp;
  }

  Studiengang getStudiengangMitString(String s) {
    Produkt tmp = sucheInListe(studiengaenge, s);
    if (tmp == null) {
      Studiengang tmpC = new Studiengang(s);
      studiengaenge.add(tmpC);
      return tmpC;
    } else
      return tmp;
  }

  Studiengang getStudiengangVonKontodaten() {
    return getKonto().getStudiengang();
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
        }
        break;
      case StudienKurs:
        {
          kurse.add(p);
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
  void init() {
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
}
