import 'Kurs.dart';
import 'Produkt.dart';
import 'Stapel.dart';

class Themengebiet extends Produkt {
  //verschiedene Themengebiete innerhalb des Kurses

//____________________________________Variables_______________________________
  String name;
  List<Stapel> stapel = new List();
  Kurs kurs;
//____________________________________Constructor_____________________________
  Themengebiet(Kurs kurs){this.kurs = kurs;}

  //____________________________________Builder-Chain___________________________
  Themengebiet mitName(String name){
    this.name = name;
    return this;
  }
//____________________________________Methods_________________________________



}