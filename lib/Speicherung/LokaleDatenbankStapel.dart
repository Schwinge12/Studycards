import 'dart:io';
import 'package:karteikartenapp/Speicherung/LokaleDatenbankKarteikarten.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'Stapel.dart';
import 'Userdata.dart';




 class LokaleDatenbankStapel{

  static final _databaseName = 'DatenbankStapel1.db';
  static final _datenbankVersion = 1;


  static final tabelle = 'karteikarten_tabelle';

  static final colId = '_id';
  static final colStudiengang = 'studiengang';
  static final colStudienfach = 'studienfach';
  static final colThemengebiet = 'themengebiet';

  static Userdata userdata = new Userdata();

  LokaleDatenbankStapel();
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
            $colStudiengang TEXT NOT NULL,
            $colStudienfach Text NOT NULL,
            $colThemengebiet Text NOT NULL
          )
          ''');
  }

  static Future<int> insert(String tabelle, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tabelle, row);
  }


  static Future<List<Map<String, dynamic>>> queryAllRows(String tabelle) async {
    Database db = await instance.database;
    return await db.query(tabelle);
  }



  static Future<int> queryRowCount(String tabelle) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tabelle'));
  }


  static Future<int> update(String tabelle, Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[colId];
    return await db.update(tabelle, row, where: '$colId = ?', whereArgs: [id]);
  }


  static Future<int> delete( int id) async {
    Database db = await instance.database;
    return await db.delete(tabelle, where: '$colId = ?', whereArgs: [id]);
  }

  static void insertStapel(Stapel s) async {
    // row to insert

    Map<String, dynamic> row = {
      LokaleDatenbankStapel.colStudiengang : s.getStudiengang(),
      LokaleDatenbankStapel.colStudienfach  : s.getStudienfachName(),
      LokaleDatenbankStapel.colThemengebiet : s.getThemengebietName()
    };
    final id = await insert(tabelle,row);

    // ^ stapel - Karteikarten v

    LokaleDatenbankKarteiKarten kk =
    new LokaleDatenbankKarteiKarten(_database, _datenbankVersion, s.getThemengebietName(), id);
    for (int i = 0 ; i < s.stapelKarten.length; i++){
      kk.insertKK(s.stapelKarten[i]);
    }
    print('inserted row id: $id in Table $tabelle');
  }


  static void ausgeben() async {
    final allRows = await queryAllRows(tabelle);
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  static void alleStapelLaden() async{
    final allRows = await queryAllRows(tabelle);
    print(allRows.asMap());
    allRows.forEach((row) => userdata.einfuegen(Stapel.StapelfromMapObject(row)
    ));
  }
  static Future<Stapel> lastEntry() async{
    final allRows = await queryAllRows(tabelle);
    return Stapel.StapelfromMapObject(allRows.last);
  }

  static void stapelLoeschen(int id) async {
    final rowsDeleted = await delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }


 }