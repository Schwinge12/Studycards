import 'package:flutter/cupertino.dart';
import 'package:karteikartenapp/Speicherung/Kurs.dart';
import 'package:karteikartenapp/Speicherung/Studiengang.dart';
import 'package:karteikartenapp/Speicherung/Themengebiet.dart';
import 'package:path_provider/path_provider.dart';

import 'Produkt.dart';
import 'Stapel.dart';
import 'Student.dart';
import 'Karteikarte.dart';
import 'Speicherung.dart';

class Userdata extends Speicherung {

  //____________________________________Variables_______________________________

  static final Userdata _userdata = Userdata._internal(); // singelton
  var _konto;
  List<Karteikarte> karteikarten; // Spericherung der KK in liste ODER
  var _datenSpeicherort;
  List<Studiengang> studiengaenge;
  List<Kurs> kurse; // <-includes List Themengebiete
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

  Produkt getProduktMitString(String nameDesProdukts, String Produkttyp) {
    switch (Produkttyp.toLowerCase().trim()) {
      case 'kurs':
      case 'fach':
      case 'studienfach' :
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

  // doppelter Code ?
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
        {
          _konto = p;
        }
        break;

      case Karteikarte:
        {
          // TODO: Duplikate checken? // stapel checken und dort einfuegen - Redundanz... Entschidung folgt
          // ignore: unnecessary_statements
          Stapel tmpKartenstapel = (p as Karteikarte).getStapel();
          if (tmpKartenstapel == null) {
            //Todo: Backend default kartenstapel anlegen und index hier eintragen
            // setze karte in default stapel ein
            //stapel[defaultindex].add(p);
          }
          else {
            //setze Karte in spezifischen Stapel
            stapel[stapel.indexOf(tmpKartenstapel)].stapelKarten.add(p);
            // check ob Kurs vorhanden
            if ((p as Karteikarte).getKurs() != null) {
              var kursindex = kurse
                  .indexOf((p as Karteikarte).getKurs());

              // check ob themengebiet vorhanden
              if ((p as Karteikarte)
                  .themengebiet != null)
                  {
                // check ob themengebiet in Kurs schon vorhanden - wenn nicht füge ein
                if (!kurse[kursindex].themengebiet.contains
                  ((p as Karteikarte)
                    .themengebiet))
                  kurse[kursindex].themengebiet.add(
                      (p as Karteikarte).themengebiet);
                var themenindex = kurse[kursindex].themengebiet.indexOf(
                    (p as Karteikarte).themengebiet);

                //füge vorhandenen stapel ins themengebiet ein
                kurse[kursindex].themengebiet[themenindex].stapel.add(
                    tmpKartenstapel);
              }
            }
          }
        }
    break;
    case Kurs:
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
