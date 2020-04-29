import 'package:flutter_test/flutter_test.dart';
import 'package:karteikartenapp/Speicherung/Karteikarte.dart';
import 'package:karteikartenapp/Speicherung/Produkt.dart';
import 'package:karteikartenapp/Speicherung/Student.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';

//Todo: Jan - Unit testing zum laufen bringen :C

test () {
  try {
    Userdata ud = new Userdata();
    Produkt p = new Student();
    Produkt p2 = new Karteikarte();
    Produkt p3 = new Karteikarte();
    ud.einfuegen(p);
    expect(ud.getKonto().hashCode, p.hashCode);
    expect(ud.karteikarten, null);
    ud.einfuegen(p2);
    ud.einfuegen(p3);
    expect(ud.karteikarten.length, 2);
    expect(ud.karteikarten.first.hashCode, p2.hashCode);
    expect(ud.karteikarten[1].hashCode, p3.hashCode);
  }
 catch (e){
    print(e);
  }


}