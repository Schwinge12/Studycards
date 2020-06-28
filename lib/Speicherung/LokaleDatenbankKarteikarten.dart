import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';




class LokaleDatenbankStapel{

  static final _databaseName= "DatenbankStapel.db";
  static final _datenbankVersion = 1;


  static final tabelle = 'karteikarten_tabelle';

  static final colId = '_id';
  static final colStringVorderseite = 'stringvorderseite';
  static final colStringRueckseite = 'stringrueckseite';
  static final colBilderAnzahl = 'bilderanzahl';


  LokaleDatenbankStapel._privateConstructor();
  static final LokaleDatenbankStapel instance = LokaleDatenbankStapel._privateConstructor();


  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _datenbankVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tabelle (
            $colId INTEGER PRIMARY KEY,
            $colStringVorderseite TEXT NOT NULL,
            $colStringRueckseite TEXT NOT NULL,
            $colBilderAnzahl INTEGER NOT NULL
          )
          ''');
  }

  static Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tabelle, row);
  }


  static Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(tabelle);
  }


  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tabelle'));
  }


  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[colId];
    return await db.update(tabelle, row, where: '$colId = ?', whereArgs: [id]);
  }


  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(tabelle, where: '$colId = ?', whereArgs: [id]);
  }

  static void insertStapel(String stringvorderseite, String stringrueckseite, int bilderanzahl) async {
    // row to insert
    Map<String, dynamic> row = {
      LokaleDatenbankStapel.colStringVorderseite : stringvorderseite,
      LokaleDatenbankStapel.colStringRueckseite  : stringrueckseite,
      LokaleDatenbankStapel.colBilderAnzahl : bilderanzahl
    };
    final id = await insert(row);
    print('inserted row id: $id');
  }

  static void _ausgeben() async {
    final allRows = await queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }
}