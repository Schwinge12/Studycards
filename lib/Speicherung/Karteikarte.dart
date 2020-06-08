import 'package:flutter/rendering.dart';
import 'package:karteikartenapp/Speicherung/Kurs.dart';
import 'package:karteikartenapp/Speicherung/Themengebiet.dart';
import 'package:karteikartenapp/Speicherung/global_lib.dart';


import 'Produkt.dart';
import 'Stapel.dart';
import 'Studiengang.dart';

class Karteikarte extends Produkt {

//____________________________________Variables_________________________________
// ID über Fach hochgezählt
  var erstellungsDatum;

  Kurs kurs;
  Stapel stapel;
  Studiengang sg;

  String vorderSeite;
  String rueckSeite;

  Themengebiet themengebiet;
  bool keyKarte = false;
  var schwierigkeit = 0;

  var haufigkeitsFaktor = 1;

  List<String> multipleChoice;

  var id;

//____________________________________Constructor_______________________________
  Karteikarte() {
    var gl = new GlobalLib();
    this.id = gl.call();
  }


//____________________________________Builder-Chain_____________________________

  Karteikarte mitKurs(Kurs kurs) {
    this.kurs = kurs;
    return this;
  }

  Karteikarte mitStudiengang(Studiengang sg) {
    this.sg = sg;
    return this;
  }

  Karteikarte mitStapel(Stapel stapel) {
    this.stapel = stapel;
    return this;
  }

  Karteikarte mitThemengebiet(Themengebiet themengebiet) {
    this.themengebiet = themengebiet;
    return this;
  }

  Karteikarte mitVorderSeite(String vorderSeite) {
    this.vorderSeite = vorderSeite;
    return this;
  }

  Karteikarte mitRueckSeite(String rueckSeite) {
    this.rueckSeite = rueckSeite;
    return this;
  }

  Karteikarte mitKeyStatus() {
    this.keyKarte = true;
    return this;
  }

  Karteikarte mitSchwierigkeit(int schwere) {
    this.schwierigkeit = schwere;
    return this;
  }

  Karteikarte mitMultipleChoice(List<String> choice) {
    this.multipleChoice = choice;
    return this;
  }

//____________________________________Get/Set___________________________________
  void setID(var x) {
    this.id = x;
  }

  Stapel getStapel() {
    return Stapel();
  }

  Kurs getKurs() {
    return kurs;
  }


//____________________________________Methods___________________________________

  /* nur für shared-Preferences SpeicherOption
  @override
  Map<String, dynamic> encodeJSON() =>
      {
        'erstellungsDatum': erstellungsDatum,
        'kurs': kurs,
        'stapel': stapel,
        'studiengang': sg,

        'vorderSeite': vorderSeite,
        'rueckSeite': rueckSeite,

        'themengebiet': themengebiet,
        //evtl optimisierung durch <dynamic, dynamic>
        'keyKarte': (keyKarte as int),
        'schwierigkeit': schwierigkeit,

        'haufigkeitsFaktor': haufigkeitsFaktor = 1,

        // evtl falsche decodierung -> custom encode
        'multipleChoice': multipleChoice,

        'id': id,
      };
  decodeJSON(Map<String, dynamic> json){
    erstellungsDatum = json['erstellungsDatum'];

    kurs = json['kurs'];
    stapel = json['stapel'];
    sg = json['studiengang'];


    vorderSeite = json['vorderSeite'];
    rueckSeite = json['rueckSeite'];

    themengebiet = json['themengebiet'];
    keyKarte = (int.parse(json['keyKarte']) as bool );
    schwierigkeit = int.parse(json['schwierigkeit']);
    haufigkeitsFaktor = int.parse(json['haufigkeitsFaktor']);


    multipleChoice = json['multipleChoice'];

    id = json['id'];
  }
*/

}