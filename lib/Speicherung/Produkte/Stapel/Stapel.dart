import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Karteikarte.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Studiengang.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Themengebiet.dart';

import 'Kurs.dart';
import '../Produkt.dart';

class Stapel extends Produkt {
//____________________________________Variables_______________________________
 List<Karteikarte> stapelKarten = new List();
 String name;
 int _id;
 Studiengang _studiengang;
 Kurs _studienfach;
 Themengebiet _themengebiet;
 var map = Map<String, dynamic> ();


//____________________________________Constructor_____________________________
 Stapel();

 //____________________________________Builder-Chain___________________________
 Stapel mitName(String name){
  this.name = name;
  return this;
 }
 Stapel mit_studiengang(String _studiengang){
  this._studiengang = new Studiengang(_studiengang);
  return this;
 }
 Stapel mit_studienfach(String _studienfach){
  this._studienfach = new Kurs().mitName(_studienfach);
  return this;
 }
 Stapel mit_themengebiet(String _themengebiet){
  this._themengebiet = new Themengebiet().mitName(_themengebiet);
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

 String getThemengebietName(){
  if (_themengebiet == null) return '404 - Themengebiet not found';
  else return _themengebiet.getName();
 }
 String getStudiengang(){
  if (_themengebiet == null) return '404 - Studiengang not found';
  else return _studiengang.name;
 }
 String getStudienfachName(){
  if (_studienfach == null) return '404 - Kurs not found';
  else return _studienfach.getName();
 }
 int getantworten(){
  int i  = 0 ;
 for (int t = 0; t < stapelKarten.length; t++){
  i =  i + stapelKarten[t].getAnswer();
  // print(('[$t] returned ') + ((stapelKarten[t].getAnswer() == 0)? 'false' : 'true'));
 }
 return i;
 }

 set studiengang(String value) {
  _studiengang.name = value;
 }

 set studienfach(String value) {
  _studienfach.name = value;
 }

 set themengebiet(String value) {
  _themengebiet.name = value;
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
  s._studiengang = new Studiengang(map['studiengang']);
  s._studienfach=new Kurs().mitName(map['studienfach']);
  s._themengebiet = new Themengebiet().mitName(map['themengebiet']);
  return s;
 }
}