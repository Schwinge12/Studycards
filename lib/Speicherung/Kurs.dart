import 'package:karteikartenapp/Speicherung/Studiengang.dart';
import 'package:karteikartenapp/Speicherung/Themengebiet.dart';

import 'Produkt.dart';

class Kurs extends Produkt {
  // Kurse eines Studiengangs bsp : Statistik

//____________________________________Variables_______________________________
  String name;
  List <Themengebiet> themengebiet = new List();
  List <Studiengang> studiengang = new List();

//____________________________________Constructor_____________________________
  Kurs();

  //____________________________________Builder-Chain___________________________
  Kurs mitName(String name){
    this.name = name;
    return this;
  }
  Kurs mitStudiengang(Studiengang sg){
    this.studiengang.add(sg);
    return this;
  }
//____________________________________Methods_________________________________



}