import 'package:karteikartenapp/Speicherung/Karteikarte.dart';

import 'Produkt.dart';

class Stapel extends Produkt {
//____________________________________Variables_______________________________
 List<Karteikarte> stapelKarten = new List();
 String name;
 int id;

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

  if(id != null)
  {
   map['id'] = id;
  }
  map['name'] =name;
  map['stapelKarten'] = stapelKarten;

  return map;
 }

 Stapel.fromMapObject(Map<String, dynamic> map) {

  this.id = map['id'];
  this.name =map['name'];
  this.stapelKarten=map['stapelKarten'];
 }
}