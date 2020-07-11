import 'Kurs.dart';
import '../Produkt.dart';
import 'Stapel.dart';

class Themengebiet extends Produkt {
  //verschiedene Themengebiete
  //Klasse war als erweiterte beschreibung des Themengebiets gedacht , findet keine Verwendung in der App

//____________________________________Variables_______________________________
  String name;

//____________________________________Constructor_____________________________
  Themengebiet();

  //____________________________________Builder-Chain___________________________
  Themengebiet mitName(String name){
    this.name = name;
    return this;
  }
//____________________________________Methods_________________________________
  getName(){
    if(name != null)
      return name;
    else
      return 'Themengebiet';
  }


}