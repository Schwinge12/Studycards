import 'Fach.dart';
import 'Produkt.dart';

class Karteikarte extends Produkt {
  //TODO: Speicherung - add builder-pattern/class

//____________________________________Variables_______________________________
// ID über Fach hochgezählt
 var erstellungsDatum;
 Fach fach;
 String vorderSeite;
 String rueckSeite;
 String themengebiet;

//____________________________________Constructor_____________________________
Karteikarte(){
   erstellungsDatum = new DateTime.now();
  }

//____________________________________Methods_________________________________
   Karteikarte withFach(Fach fach){
    this.fach = fach;
    return this;
  }
  Karteikarte withthemengebiet(String themengebiet){
    this.themengebiet = themengebiet;
    return this;
  }
  Karteikarte withVorderSeite(String vorderSeite){
    this.vorderSeite = vorderSeite;
    return this;
  }
  Karteikarte withRueckSeite(String rueckSeite){
    this.rueckSeite = rueckSeite;
    return this;
  }



}