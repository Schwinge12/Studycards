 import '../Userdata.dart';

abstract class Produkt {  //Todo: Speicherung - alle Unterklassen / Attribute implementieren
Userdata userdata;
//____________________________________Variables_______________________________

 var erstellungsDatum;

 //____________________________________Constructor_______________________________
 Produkt(){
  erstellungsDatum = new DateTime.now();
 }
//____________________________________Methods_________________________________
 //Map<dynamic, dynamic> encodeJSON();

 }