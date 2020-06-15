import 'package:karteikartenapp/Speicherung/Studiengang.dart';

import 'Produkt.dart';

class Student extends Produkt{
  //____________________________________Variables_______________________________
  String accountName;
  String _vorName;
  String _nachName;
  String _anrede;
  DateTime _geburtsdatum;
  Studiengang sg;
  // List<Kurs> kurse ?

  //Todo: Kryptographie?
  String _email;
  //String _passwort;

  //____________________________________Constructor_____________________________
  Student();

  //____________________________________Builder-Chain_____________________________
  Student mitUsername(String username){
    this.accountName = username;
    return this;
  }
  Student mitNachName(String nachName){
    this._nachName = nachName;
    return this;
  }
  Student mitVorName(String vorName){
    this._vorName = vorName;
    return this;
  }
  Student mitStudiengang(Studiengang sg){
    this.sg = sg;
    return this;
  }
  Student mitAnrede(String anrede){
    this._anrede = anrede;
    return this;
  }
  Student mitGeburtsDatum(DateTime gd){
    this._geburtsdatum = gd;
    return this;
  }
  Student mitEmail(String email){
    this._email = email;
    return this;
  }
  Student mitPasswort(String passwort){
    this._email = passwort;
    return this;
  }
  //____________________________________Get/Set_________________________________
  Studiengang getStudiengang(){return sg;}
  String getUsername(){
    if(accountName == null) return 'Username';
    else return accountName;
  }
  //____________________________________Methods_________________________________
  @override
  String toString() {
    return runtimeType.toString();
  }
  //Todo Backend : E-mailbestätigung
}