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

//____________________________________Constructor_____________________________
 Stapel();

 //____________________________________Builder-Chain___________________________
 Stapel mitName(String name){
  this.name = name;
  return this;
 }

//____________________________________Methods_________________________________
 add(Karteikarte k){stapelKarten.add(k);} // convienice
 String getName(){
  if (name != null)
   return name;
  else return '';
 }
 String getThemengebietName(){
  if (stapelKarten.isEmpty) return '404 - Themengebiet not found';
  else return stapelKarten[0].getThemengebiet().getName();
 }
 String getKursName(){
  if (stapelKarten.isEmpty) return '404 - Kurs not found';
  else return stapelKarten[0].getKurs().getName();
 }
 Map<String, dynamic> toMap() { //Stapel zu Map-Objekt konvertieren für lokale Datenbank

  var map = Map<String, dynamic> ();

  if(_id != null)
  {
   map['id'] = _id;
  }
  map['studiengang'] = _studiengang;
  map['studienfach'] = _studienfach;
  map['themengebiet'] = _themengebiet;

  return map;
 }

 Stapel.fromMapObject(Map<String, dynamic> map) {

  this._id = map['id'];
  this._studiengang =map['studiengang'];
  this._studienfach=map['studienfach'];
  this._themengebiet = map['themengebiet'];
 }


}