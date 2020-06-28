import 'dart:io';
import 'package:karteikartenapp/Speicherung/Karteikarte.dart';
import 'package:karteikartenapp/Speicherung/LokaleDatenbankStapel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'Userdata.dart';




class LokaleDatenbankKarteiKarten {

  static var tabelle;

  static final colId = '_id';
  static final colStapelId = 'sId';
  static final colStringVorderseite = 'stringvorderseite';
  static final colStringRueckseite = 'stringrueckseite';
  static final colBilderAnzahl = 'bilderanzahl';

  static Database _database;
  static int stapelId;

  static Userdata userdata = new Userdata();

  LokaleDatenbankKarteiKarten(Database db, int version, String tabellenName, int StapelId){
    tabelle = tabellenName;
    _database = db;
    _onCreate();
  }


  Future _onCreate() async {
    await _database.execute('''
          CREATE TABLE $tabelle (
            $colId INTEGER PRIMARY KEY,
            $colStapelId INTEGER FOREIGN KEY REFERENCES karteikarten_tabelle (_id),
            $colStringVorderseite TEXT NOT NULL,
            $colStringRueckseite TEXT NOT NULL,
            $colBilderAnzahl INTEGER NOT NULL
          )
          ''');
  }

  static void insertStapel(String stringvorderseite, String stringrueckseite, int bilderanzahl) async {
    // row to insert
    Map<String, dynamic> row = {
      LokaleDatenbankKarteiKarten.colStapelId : stapelId,
      LokaleDatenbankKarteiKarten.colStringVorderseite : stringvorderseite,
      LokaleDatenbankKarteiKarten.colStringRueckseite  : stringrueckseite,
      LokaleDatenbankKarteiKarten.colBilderAnzahl : bilderanzahl
    };
    final id = await LokaleDatenbankStapel.insert(tabelle, row);
    print('inserted row id: $id');
  }

  static void _ausgeben() async {
    final allRows = await LokaleDatenbankStapel.queryAllRows(tabelle);
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  static void alleKarteikartenLaden() async{
    final allRows = await LokaleDatenbankStapel.queryAllRows(tabelle);
    allRows.forEach((row) => userdata.stapel[stapelId].add(Karteikarte.KKfromMapObject(row)));
  }



}