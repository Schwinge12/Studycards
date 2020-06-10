import 'dart:async';
import 'package:karteikartenapp/Speicherung/Userdata.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:karteikartenapp/Speicherung/Stapel.dart';



class LokaleDatenbankHelfer{

  static LokaleDatenbankHelfer _lokaleDatenbank;
  static Database _database;


  String karteikartenTabelle = 'karteikarten_tabelle';
  String colId = 'id';
  String colTextVorderseite = 'text_vorderseite';
  String colBildVorderseite = 'bild_vorderseite';
  String colTextRueckseite = 'text_rueckseite';
  String colBildRueckseite = 'bild_rueckseite';


  LokaleDatenbankHelfer._createInstance();

  factory LokaleDatenbankHelfer(){
    if(_lokaleDatenbank == null)
    {
      _lokaleDatenbank = LokaleDatenbankHelfer._createInstance();
    }
    return _lokaleDatenbank;
  }

  Future<Database> get database async{
    if(_database == null)
    {
      _database = await datenbankErstellen();
    }
    return _database;
  }
  Future <Database> datenbankErstellen() async{ //Datenbank erstellen
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path +'stapel.db';
    var stapelDatenbank = openDatabase(path, version: 1, onCreate: _createDb);
    return stapelDatenbank;
  }
  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $karteikartenTabelle($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTextVorderseite TEXT, $colBildVorderseite TEXT, $colTextRueckseite TEXT, $colBildRueckseite )');
  }

  Future<List<Map<String, dynamic>>>getStapelMapList() async{ //von der Datenbank lesen
    Database db = await this.database;

    var result =await db.rawQuery('SELECT * FROM $karteikartenTabelle order by $colId ASC');

    return result;
  }

  Future<int> stapelEinfuegen (Stapel stapel) async{ //In Datenbank einfügen
    Database db =await this.database;
    var result = await db.insert(karteikartenTabelle, stapel.toMap());
    return result;
  }

  Future<int> stapelAktualisieren (Stapel stapel) async{ //Update Datenbank
    var db =await this.database;
    var result = await db.update(karteikartenTabelle, stapel.toMap(), where: '$colId = ?', whereArgs: [stapel.id]);
    return result;
  }

  Future<int> stapelLoeschen (int id) async{ //Löschen
    var db =await this.database;
    int result = await db.rawDelete('DELETE FROm $karteikartenTabelle WHERE &colId = $id');
    return result;
  }

  Future<int> getCounter() async{ //Getter für Anzahl der Stapel
    Database db =await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $karteikartenTabelle');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}