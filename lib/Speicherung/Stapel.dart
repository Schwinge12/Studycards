import 'package:karteikartenapp/Speicherung/Karteikarte.dart';
import 'package:karteikartenapp/Speicherung/Studiengang.dart';
import 'package:karteikartenapp/Speicherung/Themengebiet.dart';

import 'Kurs.dart';
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
 Stapel mit_studiengang(String _studiengang){
  this._studiengang = _studiengang;
  return this;
 }
 Stapel mit_studienfach(String _studienfach){
  this._studienfach = _studienfach;
  return this;
 }
 Stapel mit_themengebiet(String _themengebiet){
  this._themengebiet = _themengebiet;
  return this;
 }
 Stapel mit_karte(Karteikarte k){
  this.stapelKarten.add(k);
  return this;
 }

 Stapel mitId(int _id) {
  this._id = _id;
 } //____________________________________Get/Set___________________________________

 String getName(){
  if (name != null)
   return name;
  else return '';
 }
 int getID(){
  return _id;
 }
 bool istID(var zuPruefen){
  return (zuPruefen == _id);
 }

 String getThemengebietName(){
  if (_themengebiet == null) return '404 - Themengebiet not found';
  else return _themengebiet;
 }
 String getStudiengang(){
  if (_themengebiet == null) return '404 - Studiengang not found';
  else return _studiengang;
 }
 String getStudienfachName(){
  if (_studienfach == null) return '404 - Kurs not found';
  else return _studienfach;
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

 set id(int value){
  _id= value;
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


 static Stapel StapelfromMapObject(Map<String, dynamic> map) {
  Stapel s = new Stapel();
  s._id = map['_id'];
  s._studiengang =map['studiengang'];
  s._studienfach=map['studienfach'];
  s._themengebiet = map['themengebiet'];
  return s;
 }

}