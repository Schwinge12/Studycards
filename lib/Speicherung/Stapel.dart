import 'package:karteikartenapp/Speicherung/Karteikarte.dart';

import 'Produkt.dart';

class Stapel extends Produkt {
//____________________________________Variables_______________________________
 List<Karteikarte> stapelKarten;

//____________________________________Constructor_____________________________
 Stapel();
//____________________________________Methods_________________________________
 add(Karteikarte k){stapelKarten.add(k);} // convienice
}