import 'Produkt.dart';

class Student extends Produkt{
  //____________________________________Variables_______________________________
  String accountName;
  String _vorName;
  String _nachName;
  String anrede;
  DateTime _geburtsdatum;
  // List<Kurs> kurse ?

  //Todo: Kryptographie?
  String _email;
  String _passwort;

  //____________________________________Constructor_____________________________
  Student();

  //____________________________________Builder-Chain_____________________________
  Student mitNachName(String nachName){
    this._nachName = nachName;
    return this;
  }
  Student mitVorName(String vorName){
    this._vorName = vorName;
    return this;
  }
  Student mitAnrede(String anrede){
    this.anrede = anrede;
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
  //____________________________________Methods_________________________________

}