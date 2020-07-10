import 'dart:io';
import 'package:karteikartenapp/Speicherung/DB/LokaleDatenbankKarteikarten.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../Produkte/Stapel/Karteikarte.dart';
import '../Produkte/Stapel/Stapel.dart';
import '../Userdata.dart';




 class LokaleDatenbankStapel{

  static final _databaseName = 'Stapel10.db';
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
  static Future<int> updateStapel(Stapel s) async {
    Database db = await instance.database;
    Map<String, dynamic> row = LokaleDatenbankStapel.getRowFromStapel(s);
    int id = row[colId];
    return await db.update(tabelle, row, where: '$colId = ?', whereArgs: [id]);
  }



  static Future<int> delete( int id, var tabelle) async {
    Database db = await instance.database;
    return await db.delete(tabelle, where: '$colId = ?', whereArgs: [id]);
  }

  static void insertStapel(Stapel s) async {
    // row to insert

    final id = await insert(tabelle,getRowFromStapel(s));

    // ^ stapel - Karteikarten v

    LokaleDatenbankKarteiKarten kk =
    new LokaleDatenbankKarteiKarten(_database, _datenbankVersion, s.getThemengebietName(), id);
    for (int i = 0 ; i < s.stapelKarten.length; i++){
      kk.insertKK(s.stapelKarten[i]);
    }
    print('inserted row id: $id in Table $tabelle');
  }
  
  static getRowFromStapel(Stapel s){
    Map<String, dynamic> row = {
      LokaleDatenbankStapel.colStudiengang : s.getStudiengang(),
      LokaleDatenbankStapel.colStudienfach  : s.getStudienfachName(),
      LokaleDatenbankStapel.colThemengebiet : s.getThemengebietName()
    };
    return row;
  }


  static void ausgeben(String tabelle) async {
    final allRows = await queryAllRows(tabelle);
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  static void alleStapelLaden() async{
    final allRows = await queryAllRows(tabelle);
    print(allRows.asMap());
    allRows.forEach((row) => StapelmitKarteikartenLaden(row));
  }
  static Future<Stapel> lastEntry() async{
    final allRows = await queryAllRows(tabelle);
    return await alleKarteikartenLaden( Stapel.StapelfromMapObject(allRows.last));
  }

  static void stapelLoeschen(Stapel s) async {
    var id = s.getID();
    var tg = s.getThemengebietName();

    final rowsDeleted = await delete(id, tabelle);
    print('deleted $rowsDeleted row(s): row $id');

    _database.rawQuery('DROP TABLE IF EXISTS $tg');
    print('deleted table: $tg');
  }

  static void StapelmitKarteikartenLaden(var row) async {
    Stapel tmpStapel = Stapel.StapelfromMapObject(row);
    userdata.einfuegen( await alleKarteikartenLaden(tmpStapel));
  }
  static Future<Stapel> alleKarteikartenLaden(Stapel s) async{
    var tbl = s.getThemengebietName();
    final allRows = await _database.rawQuery(
        'SELECT * FROM $tbl');
    allRows.forEach((row) async => s.stapelKarten.add(await Karteikarte.KKfromMapObject(row)));
    return s;
  }
  static Future<Stapel> alleKarteikartenUpdaten(Stapel s) async{
    var tbl = s.getThemengebietName();
    final allRows = await _database.rawQuery(
        'SELECT * FROM $tbl');
    for(int t = 0; t< allRows.length; t++) {
      _database.update(
          tbl, LokaleDatenbankKarteiKarten.getRowFromKK(s.stapelKarten[t]), where: '$colId = ?', whereArgs: [s.stapelKarten[t].id]);
    print('updated : $t in $tbl');
    }
    return s;
  }
  

  


 }