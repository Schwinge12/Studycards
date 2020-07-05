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
  static final colAnswer = 'answer';

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
            $colId INTEGER PRIMARY KEY,
           
            $colStringVorderseite TEXT NOT NULL,
            $colStringRueckseite TEXT NOT NULL,
            $colBilderAnzahl INTEGER NOT NULL,
            $colAnswer INTEGER NOT NULL
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
  static getRowFromKK(Karteikarte k){
    Map<String, dynamic> row = {
      LokaleDatenbankKarteiKarten.colStringVorderseite : k.getVorderSeite(),
      LokaleDatenbankKarteiKarten.colStringRueckseite  : k.getRueckSeite(),
      LokaleDatenbankKarteiKarten.colBilderAnzahl : k.bilder.length,
      LokaleDatenbankKarteiKarten.colAnswer : k.getAnswer()
    };
    return row;
  }

}