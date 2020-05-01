import 'Produkt.dart';

abstract class Speicherung{
  // workaround,in dart kein interface

  void einfuegen(Produkt p);

  void loeschen(Produkt p);

  void bearbeiten(Produkt p);

  void laden();

}