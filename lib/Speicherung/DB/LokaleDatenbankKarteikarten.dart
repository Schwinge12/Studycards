import 'dart:io';
import 'package:karteikartenapp/Speicherung/Produkte/Stapel/Karteikarte.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankStapel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../Produkte/Stapel/Stapel.dart';
import '../Userdata.dart';




class LokaleDatenbankKarteiKarten {

  static var tabelle;

  static final colId = '_id';
  static final colStapelId = 'sId';
  static final colStringVorderseite = 'stringvorderseite';
  static final colStringRueckseite = 'stringrueckseite';
  static final colBilderAnzahl = 'bilderanzahl';
  static final colAnswer = 'answer';
  static final colThemengebiet = 'themengebiet'; // benötigt für bilderpfad ... redundanz

  static Database _database;
  static int stapelId;
  LokaleDatenbankKarteiKarten._privateConstructor();
  static final LokaleDatenbankKarteiKarten instance = LokaleDatenbankKarteiKarten._privateConstructor();

  static Userdata userdata = new Userdata();

  LokaleDatenbankKarteiKarten(Database db, int version, String tabellenName, int StapelId){
    tabelle = tabellenName;
    _database = db;
    _onCreate();
  }

  Future<Database> get database async {
    return _database;
  }


  Future _onCreate() async {
    await _database.execute('''
          CREATE TABLE $tabelle (
            $colId INTEGER PRIMARY KEY ,
           
            $colStringVorderseite TEXT NOT NULL,
            $colStringRueckseite TEXT NOT NULL,
            $colBilderAnzahl INTEGER NOT NULL,
            $colAnswer INTEGER NOT NULL,
            $colThemengebiet TEXT NOT NULL
          )
          ''');
    // $colStapelId INTEGER FOREIGN KEY REFERENCES karteikarten_tabelle (_id),
    print('Tabelle: $tabelle erstellt');
  }

  void insertKK(Karteikarte k) async {
    // row to insert
    Map<String, dynamic> row = getRowFromKK(k);
    final id = await _database.insert(tabelle, row);
    print('inserted row id: $id');
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[colId];
    return await db.update(tabelle, row, where: '$colId = ?', whereArgs: [id]);
  }

  static void updateKk(Karteikarte k) async {
    // row to update
    Map<String, dynamic> row = getRowFromKK(k);
    final rowsAffected = await _database.update(tabelle, row);
    print('updated $rowsAffected row(s)');
  }

  static Future<int> delete(int id, var tabelle) async {
    Database db = await instance.database;
    return await db.delete(tabelle, where: '$colId = ?', whereArgs: [id]);
  }

  static void karteikarteLoeschen(Karteikarte s) async {
    var id = s.id;
    final rowsDeleted = await delete(id, tabelle);
    print('deleted $rowsDeleted row(s): row $id');
  }
  static  Map<String, dynamic> getRowFromKK(Karteikarte k){
    Map<String, dynamic> row = {
      LokaleDatenbankKarteiKarten.colStringVorderseite : k.getVorderSeite(),
      LokaleDatenbankKarteiKarten.colStringRueckseite  : k.getRueckSeite(),
      LokaleDatenbankKarteiKarten.colBilderAnzahl : bilderAlsInt(k),
      LokaleDatenbankKarteiKarten.colAnswer : k.getAnswer(),
      LokaleDatenbankKarteiKarten.colThemengebiet : k.getThemengebiet()
    };
    return row;
  }
  static int bilderAlsInt(Karteikarte k){
    int i ;
    (k.bilder[0] == null && k.bilder[1] != null)? i = 1 :     // Vorderseite kein bild - rueckseite  bild
    (k.bilder[1] == null  && k.bilder[0] != null)? i = 2 :    // Vorderseite  bild - rueckseite kein bild
    (k.bilder[1] != null  && k.bilder[0] != null)? i = 3 :    // beide seiten bild
       i=  0;                                                 // keine seite bild
    return i;
}

static List<String> kkToStringList(Karteikarte k){
      List<String> s = new List();
      getRowFromKK(k).forEach((key, value) => s.add(key.toString() + ':' + value.toString() ));
      return s;
}
  static Map<String, dynamic> rowFromStringList(List<String> s)  {
    Map<String, dynamic> row = new Map();
    s.forEach((e) => row[e.split(":").first] = e.split(":").last);
    return row;
  }

}