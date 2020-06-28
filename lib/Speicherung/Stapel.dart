import 'package:karteikartenapp/Speicherung/Karteikarte.dart';

import 'Produkt.dart';

class Stapel extends Produkt {
//____________________________________Variables_______________________________
 List<Karteikarte> stapelKarten = new List();
 String name;
 int _id;
 String _studiengang;
 String _studienfach;
 String _themengebiet;
 var map = Map<String, dynamic> ();


//____________________________________Constructor_____________________________
 Stapel();

 //____________________________________Builder-Chain___________________________
 Stapel mitName(String name){
  this.name = name;
  return this;
 }

 set id(int value) {
  _id = value;
 } //____________________________________Get/Set___________________________________

 String getName(){
  if (name != null)
   return name;
  else return '';
 }
 String getThemengebietName(){
  if (_themengebiet == null) return '404 - Themengebiet not found';
  else return _themengebiet;
 }
 String getKursName(){
  if (stapelKarten.isEmpty) return '404 - Kurs not found';
  else return stapelKarten[0].getKurs().getName();
 }
 set studiengang(String value) {
  _studiengang = value;
 }

 set studienfach(String value) {
  _studienfach = value;
 }

 set themengebiet(String value) {
  _themengebiet = value;
 }
//____________________________________Methods_________________________________
 add(Karteikarte k){stapelKarten.add(k);} // convienice

 Map<String, dynamic> toMap() { //Stapel zu Map-Objekt konvertieren für lokale Datenbank

  if(_id != null)
  {
   map['id'] = _id;
  }
  map['studiengang'] = _studiengang;
  map['studienfach'] = _studienfach;
  map['themengebiet'] = _themengebiet;
  return map;
 }

 fromMapObject(Map<String, dynamic> map) {

  this._id = map['id'];
  this._studiengang =map['studiengang'];
  this._studienfach=map['studienfach'];
  this._themengebiet = map['themengebiet'];
 }

 static Stapel StapelfromMapObject(Map<String, dynamic> map) {
 Stapel s = new Stapel();
  s._id = map['id'];
  s._studiengang =map['studiengang'];
  s._studienfach=map['studienfach'];
  s._themengebiet = map['themengebiet'];
  return s;
 }

}