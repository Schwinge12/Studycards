import 'dart:io';
import 'package:karteikartenapp/Speicherung/Karteikarte.dart';
import 'package:karteikartenapp/Speicherung/LokaleDatenbankStapel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'Stapel.dart';
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
           
            $colStringVorderseite TEXT NOT NULL,
            $colStringRueckseite TEXT NOT NULL,
            $colBilderAnzahl INTEGER NOT NULL
          )
          ''');
    // $colStapelId INTEGER FOREIGN KEY REFERENCES karteikarten_tabelle (_id),
    print('Tabelle: $tabelle erstellt');
  }

   void insertKK(Karteikarte k) async {
    // row to insert
    Map<String, dynamic> row = {
      LokaleDatenbankKarteiKarten.colStringVorderseite : k.getVorderSeite(),
      LokaleDatenbankKarteiKarten.colStringRueckseite  : k.getRueckSeite(),
      LokaleDatenbankKarteiKarten.colBilderAnzahl : k.bilder.length
    };
    final id = await _database.insert(tabelle, row);
    print('inserted row id: $id');
  }





}