import 'package:sqflite/sqflite.dart';
import 'Quizfragen.dart';
class LokaleDatenbankQuizfragen{

  static var tabelle;

  static final colId = '_id';
  static final colQuizId = 'qId';
  static final colFrage = 'frage';
  static final colAntwort1 = 'antwort1';
  static final colBool1 = 'bool1';
  static final colAntwort2 = 'antwort2';
  static final colBool2 = 'bool2';
  static final colAntwort3 = 'antwort3';
  static final colBool3 = 'bool3';
  static final colAntwort4 = 'antwort4';
  static final colBool4 = 'bool4';

  static Database _database;

  LokaleDatenbankQuizfragen._privateConstructor();
  static final LokaleDatenbankQuizfragen instance = LokaleDatenbankQuizfragen._privateConstructor();

  LokaleDatenbankQuizfragen(Database db, int version, String tabellenName, int StapelId){
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
           
            $colFrage TEXT NOT NULL,
            $colAntwort1 TEXT NOT NULL,
            $colBool1 INTEGER NOT NULL,
            $colAntwort2 TEXT NOT NULL,
            $colBool2 INTEGER NOT NULL,
            $colAntwort3 TEXT NOT NULL,
            $colBool3 INTEGER NOT NULL,
            $colAntwort4 TEXT NOT NULL,
            $colBool4 INTEGER NOT NULL,
          )
          ''');
    // $colStapelId INTEGER FOREIGN KEY REFERENCES karteikarten_tabelle (_id),
    print('Tabelle: $tabelle erstellt');
  }

  void insertQF(Quizfragen qf) async {
    // row to insert
    Map<String, dynamic> row = {
      LokaleDatenbankQuizfragen.colFrage : qf.frage,
      LokaleDatenbankQuizfragen.colAntwort1 : qf.antwort1,
      LokaleDatenbankQuizfragen.colBool1 : qf.bool1,
      LokaleDatenbankQuizfragen.colAntwort2 : qf.antwort2,
      LokaleDatenbankQuizfragen.colBool2 : qf.bool2,
      LokaleDatenbankQuizfragen.colAntwort3 : qf.antwort3,
      LokaleDatenbankQuizfragen.colBool3 : qf.bool3,
      LokaleDatenbankQuizfragen.colAntwort4 : qf.antwort4,
      LokaleDatenbankQuizfragen.colBool4 : qf.bool4,
    };
    final id = await _database.insert(tabelle, row);
    print('inserted row id: $id');
  }
}