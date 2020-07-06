
import 'dart:io';

import 'package:karteikartenapp/MainScreen/Quiz/Quiz.dart';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankQuizfragen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/QuizNeu.dart';
import 'package:karteikartenapp/Speicherung/Produkte/Quiz/Quizfragen.dart';
import 'package:karteikartenapp/Speicherung/Userdata.dart';

class LokaleDatenbankQuiznamen {

  static final _databaseName = "Quiz0.db";
  static final _databaseVersion = 2;

  static final table = 'quiz_tabelle';

  static final colId = '_id';
  static final colStudienfach = 'studienfach';
  static final colThemengebiet = 'themengebiet';

  LokaleDatenbankQuiznamen._privateConstructor();
  static final LokaleDatenbankQuiznamen instance = LokaleDatenbankQuiznamen._privateConstructor();

  static Userdata userdata =new Userdata();


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

  static Future<List<Map<String, dynamic>>> queryAllRows(String tabelle) async {
    Database db = await instance.database;
    return await db.query(tabelle);
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

    Database db = await instance.database;

    LokaleDatenbankQuizfragen qf =
    new LokaleDatenbankQuizfragen(db, _databaseVersion, q.themengebiet, id);
    for (int i = 0 ; i < q.fragenliste.length; i++){
      qf.insertQF(q.fragenliste[i]);
    }

    print('inserted row id: $id');
  }

  static void ausgeben() async {
    final allRows = await queryAllRows(table);
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  static void alleQuizeLaden() async{
    final allRows = await queryAllRows(table);
    print(allRows.asMap());
    allRows.forEach((row) => QuizmitFragenLaden(row));
  }

  static void QuizmitFragenLaden(var row) async {
    QuizNeu tmpQuiz = QuizNeu.QuizfromMapObject(row);
    userdata.einfuegen( await alleQuizfragenLaden(tmpQuiz));
  }

  static Future<QuizNeu> alleQuizfragenLaden(QuizNeu q) async{
    var tbl = q.themengebiet;
    final allRows = await _database.rawQuery(
        'SELECT * FROM $tbl');
    allRows.forEach((row) async => q.fragenliste.add(await Quizfragen.QFfromMapObject(row)));
    return q;
  }
  static Future<QuizNeu> alleQuizfragenUpdaten(QuizNeu q) async{
    var tbl = q.themengebiet;
    final allRows = await _database.rawQuery(
        'SELECT * FROM $tbl');
    for(int t = 0; t< allRows.length; t++) {
      _database.update(
          tbl, LokaleDatenbankQuizfragen.getRowFromKK(q.fragenliste[t]), where: '$colId = ?', whereArgs: [q.fragenliste[t].id]);
      print('updated : $t in $tbl');
    }
    return q;
  }

  static Future<QuizNeu> lastEntry() async{
    final allRows = await queryAllRows(table);
    return await alleQuizfragenLaden(QuizNeu.QuizfromMapObject(allRows.last));
  }


}