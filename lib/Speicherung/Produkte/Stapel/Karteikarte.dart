import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Kurs.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Themengebiet.dart';
import 'package:karteikartenapp/Speicherung/GlobalLib.dart';


import '../Produkt.dart';
import 'Stapel.dart';
import 'Studiengang.dart';
import '../../FileManager.dart';

class Karteikarte extends Produkt {

//____________________________________Variables_________________________________


  var erstellungsDatum;

//Todo Jan Themengebiet / Studiengang / Kurs von KK in Stapel verschieben

  String _vorderSeite;
  String _rueckSeite;
  String themengebiet;

  bool answeredTrue = false;
  var schwierigkeit = 0;

  var haufigkeitsFaktor = 1;

  var id;

  List<File> bilder = new List(2);

//____________________________________Constructor_______________________________
  Karteikarte();

//____________________________________Builder-Chain_____________________________


  Karteikarte mitID(var id) {
    this.id = id;
    return this;
  }
  



  Karteikarte mitVorderSeite(String vorderSeite) {
    this._vorderSeite = vorderSeite;
    return this;
  }
  Karteikarte mitAnswer(int  a) {
    (a == 0)? this.answeredTrue = false: this.answeredTrue = true;
    return this;
  }

  Karteikarte mitRueckSeite(String rueckSeite) {
    this._rueckSeite = rueckSeite;
    return this;
  }

  Karteikarte mitFileSpeichern(String themengebiet, File bild) {
    bilder.add(bild);
    FileManager.writeFile(themengebiet,id , bild,bilder.length -1); // -1 -> dateisystem startet bei 0
    print('saving file ' + bilder.indexOf(bild).toString());
    return this;
  }

  void mitFile(File bild, int index) {
    this.bilder[index] = bild;
  }
  Karteikarte mitThemengebiet(String themengebiet) {
   this.themengebiet = themengebiet;
   return this;
  }

  Karteikarte mitKeyStatus() {
    this.answeredTrue = true;
    return this;
  }

  Karteikarte mitSchwierigkeit(int schwere) {
    this.schwierigkeit = schwere;
    return this;
  }


//____________________________________Get/Set___________________________________
  void setID(var x) {
    this.id = x;
  }


  String getRueckSeite(){
  if (_rueckSeite != null)
    return _rueckSeite;
   return '';
  }
  String getVorderSeite(){
    if (_vorderSeite != null)
      return _vorderSeite;
    return '';
  }
  String getThemengebiet(){
    return themengebiet;
  }
  int getAnswer() {
    if (answeredTrue==true) return 1;
    return 0;
  }
  //____________________________________Methods___________________________________

  static Future<Karteikarte> KKfromMapObject(Map<String, dynamic> map) async {
    var bilderzahl = map['bilderanzahl'];
    var id = map['_id'];
    String themengebiet = map['themengebiet'];
    Karteikarte s = new Karteikarte()
    .mitID(id)
    .mitVorderSeite(map['stringvorderseite'])
    .mitRueckSeite(map['stringrueckseite'])
    .mitAnswer(map['answer'])
    .mitThemengebiet(themengebiet)
    ;

    switch (bilderzahl){
      case 1:{
        //k.bilder[1]
        s.mitFile(await FileManager.getFile(themengebiet, id, 1), 1);
      }
      break;
      case 2:{
        //k.bilder[0]
        s.mitFile(await FileManager.getFile(themengebiet, id, 0), 0);
      }
      break;
      case 3:{
        s.mitFile(await FileManager.getFile(themengebiet, id, 0), 0);
        s.mitFile(await FileManager.getFile(themengebiet, id, 1), 1);
      }
      break;
    }
    return s;
  }





}