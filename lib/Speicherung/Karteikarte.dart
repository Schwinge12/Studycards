import 'package:karteikartenapp/Speicherung/global_lib.dart';

import 'Fach.dart';
import 'Produkt.dart';
import 'Stapel.dart';

class Karteikarte extends Produkt {

//____________________________________Variables_________________________________
// ID über Fach hochgezählt
 var erstellungsDatum;

 Kurs fach;
 Stapel stapel;

 String vorderSeite;
 String rueckSeite;

 String themengebiet;
 bool keyKarte = false;
 var schwierigkeit = 0;

 List<String> multipleChoice;

 var id;

//____________________________________Constructor_______________________________
Karteikarte(){
  var gl = new GlobalLib(); // Todo in main verschieben (sollte fürs erste gehen)
  this.id = gl.call();
}
//____________________________________Builder-Chain_____________________________

  Karteikarte mitKurs(Kurs fach){
    this.fach = fach;
    return this;
  }
  Karteikarte mitStapel(Stapel stapel){
    this.stapel = stapel;
    return this;
  }
  Karteikarte mitThemengebiet(String themengebiet){
    this.themengebiet = themengebiet;
    return this;
  }
  Karteikarte mitVorderSeite(String vorderSeite){
    this.vorderSeite = vorderSeite;
    return this;
  }
  Karteikarte mitRueckSeite(String rueckSeite){
    this.rueckSeite = rueckSeite;
    return this;
  }
  Karteikarte mitKeyStatus(){
    this.keyKarte = true;
    return this;
  }
  Karteikarte mitSchwierigkeit(int schwere){
    this.schwierigkeit = schwere;
    return this;
  }
  Karteikarte mitMultipleChoice(List<String> choice){
    this.multipleChoice = choice;
    return this;
  }
//____________________________________Get/Set___________________________________
  void setID(var x){this.id = x;}
//____________________________________Methods___________________________________

}