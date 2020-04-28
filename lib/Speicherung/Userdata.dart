import 'package:karteikartenapp/Speicherung/Fach.dart';
import 'package:path_provider/path_provider.dart';

import 'Produkt.dart';
import 'Student.dart';
import 'Karteikarte.dart';
import 'Speicherung.dart';


 class Userdata extends Speicherung{

  //____________________________________Variables_______________________________

  var _konto;
  var karteikarten;
  var _datenSpeicherort;
  var faecher;


  //____________________________________Constructor_____________________________

Userdata(){
    _datenSpeicherort =  getApplicationDocumentsDirectory();
    this.laden();

}
  //____________________________________Get/Set_________________________________
   Student getKonto(){ return _konto; }

   Fach getFachMitString(String x){
     for (int i = 0; i < faecher.length; i++){
       if (faecher[i].toString().trim().toLowerCase().compareTo(x.trim().toLowerCase()) == 0) return faecher[i];
      }
     einfuegen(new Fach(x));
   }



  //____________________________________Methods_________________________________

  @override
void einfuegen(dynamic p){

    switch (p.runtimeType){
      case Student : {
        _konto = p;
      }
      break;

      case Karteikarte : {
       // TODO: Duplikate checken?
        karteikarten.add(p);
        // call speichern(karteikarten)
      }
      break;
      case Fach : {
        // TODO: Duplikate checken?
        faecher.add(p);
        // call speichern(karteikarten)
      }
      break;
      // add other Products?
    }

  }

  @override
  void bearbeiten(Produkt p) {
    // TODO: Speicherung - implement bearbeiten
  }

  @override
  void laden() {
    // TODO: Speicherung - implement laden
    //data?
      // + load data
      // - create new lists (karteikarten)
  }

  @override
  void loeschen(Produkt p) {
    // TODO: Speicherung - implement loeschen
  }

    // TODO: Speicherung - Algorithmen zur Listensuche / abgleich / Threading für laufzeitverbesserung

}