import 'package:karteikartenapp/Speicherung/Themengebiet.dart';

import 'Produkt.dart';

class Kurs extends Produkt {
  // Kurse eines Studiengangs bsp : Statistik

//____________________________________Variables_______________________________
  String name;
  List <Themengebiet> themengebiet;

//____________________________________Constructor_____________________________
  Kurs();

  //____________________________________Builder-Chain___________________________
  Kurs mitName(String name){
    this.name = name;
    return this;
  }
//____________________________________Methods_________________________________



}