
import 'dart:io';

import 'package:karteikartenapp/MainScreen/Quiz/Quiz.dart';
import 'package:karteikartenapp/Speicherung/LokaleDatenbankQuizfragen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:karteikartenapp/Speicherung/QuizNeu.dart';

class LokaleDatenbankQuiznamen {

  static final _databaseName = "Quiz.db";
  static final _databaseVersion = 2;

  static final table = 'quiz_tabelle';

  static final colId = '_id';
  static final colStudienfach = 'studienfach';
  static final colThemengebiet = 'themengebiet';

  LokaleDatenbankQuiznamen._privateConstructor();
  static final LokaleDatenbankQuiznamen instance = LokaleDatenbankQuiznamen._privateConstructor();


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
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $colId INTEGER PRIMARY KEY,
            $colStudienfach TEXT NOT NULL,
            $colThemengebiet TEXT NOT NULL
          )
          ''');
  }

  static Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  static Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  static Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  static Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[colId];
    return await db.update(table, row, where: '$colId = ?', whereArgs: [id]);
  }

  static Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$colId = ?', whereArgs: [id]);
  }

  static void insertQuiz(QuizNeu q) async {
    Map<String, dynamic> row = {
      LokaleDatenbankQuiznamen.colStudienfach : q.studienfach,
      LokaleDatenbankQuiznamen.colThemengebiet : q.themengebiet,
    };
    final id = await insert(row);

    print('inserted row id: $id');
  }

  static void ausgeben() async {
    final allRows = await queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }


}