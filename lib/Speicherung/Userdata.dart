import 'package:flutter/cupertino.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Konten/Dozent.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Kurs.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankQuiznamen.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankStapel.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Studiengang.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Themengebiet.dart';
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
  Stapel defaultStapel = new Stapel().mitName('Default').mit_studienfach('Bsp.Fach').mit_themengebiet('Bsp.Thema');
  Student testkonto = new Student().mitUsername('Mustermann');
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
  List<Stapel> getStapelListe() {
    return stapel;
  }

  Produkt getProduktMitString(String nameDesProdukts, String Produkttyp) {
    switch (Produkttyp.toLowerCase().trim()) {
      case 'kurs':
      case 'fach':
      case 'studienfach':
        {
          return getKursMitString(nameDesProdukts);
        }
        break;
      case 'stapel':
        {
          getStapelMitString(nameDesProdukts);
        }
        break;
      case 'konto':
        {
          return getKonto();
        }
        break;
      case 'studiengang':
        {
          return getStudiengangVonKontodaten();
        }
        break;
    }
  }

  Themengebiet getThemengebietMitKursUndString(Kurs k, String s) {
    Produkt tmp = sucheInListe(k.themengebiet, s);
    if (tmp == null) {
      Themengebiet tmpthemengebiet =new Themengebiet (k).mitName(s);
      k.themengebiet.add(tmpthemengebiet);
      return tmpthemengebiet;
    } else
      return tmp;
  }
  Kurs getKursMitString(String s) {
    Produkt tmp = sucheInListe(kurse, s);

    if (tmp == null) {
      Kurs tmpFach = new Kurs().mitName(s);
      kurse.add(tmpFach);
      return tmpFach;
    } else
      return tmp;
  }

  Stapel getStapelMitString(String nameDesStapels) {
    Produkt tmp = sucheInListe(stapel, nameDesStapels);
    if (tmp == null) {
      Stapel tmpStapel = new Stapel().mitName(nameDesStapels);
      stapel.add(tmpStapel);
      return tmpStapel;
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
      case Tutor:
      case Dozent:
        {
          _konto = p;
          init();
        }
        break;
      case Karteikarte:
        {
          /*
          Karteikarte kk = (p as Karteikarte);
          Stapel tmpKartenstapel = kk.getStapel();
          print (tmpKartenstapel == null);
          if (tmpKartenstapel == null) {
            print('TEST------------------------------------------------------5');
            kk.stapel = defaultStapel;
            stapel[0].add(p);
          } else {
            print('TEST------------------------------------------------------0');
            if (!stapel.contains(tmpKartenstapel)) {
              print(
                  'TEST------------------------------------------------------1');
              stapel.add(tmpKartenstapel);
            }
            print('TEST------------------------------------------------------2');
            stapel[stapel.indexOf(tmpKartenstapel)].stapelKarten.add(p);
           if (kk.kurs != null && kk.themengebiet != null) {
             stapelinThemengebietEinfuegen(kk.kurs, kk.themengebiet, kk.stapel);
             print(
                 'TEST------------------------------------------------------4');
           }
          }
          print(tmpKartenstapel.stapelKarten.length.toString());
          stapel.forEach((element) => print(element.getName()));
          */

        }
        break;
      case Stapel:
        {
          // nur für default stapel ...
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
      case Karteikarte:
        {
          /*//check ob KK in default stapel
           stapel[stapel.indexOf((p as Karteikarte).stapel)].stapelKarten.remove(p as Karteikarte);

            nur Verwenden falls notwending --------

           // schau in themengebiet und schmeiß karte da raus

               if ((p as Karteikarte).themengebiet != null &&
                  (p as Karteikarte).kurs != null) {
                  Kurs tmpKurs = kurse[kurse.indexOf((p as Karteikarte).kurs)];
                  Themengebiet tmpThemengebiet = tmpKurs.themengebiet[tmpKurs
                   .themengebiet.indexOf((p as Karteikarte).themengebiet)];
                if (tmpThemengebiet.stapel.contains(p as Karteikarte))
                tmpThemengebiet.stapel.remove(p as Karteikarte);
                }
*/        }
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
      default: throw new FlutterError('Nicht Implementiert!');
    }
  }

  @override
  void init() {
    // Testdaten ____________________________
    LokaleDatenbankStapel.alleStapelLaden();
    LokaleDatenbankQuiznamen.alleQuizeLaden();
    // TODO: Speicherung - implement laden
    //data?
    // + load data
    // - create new lists (karteikarten)
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
