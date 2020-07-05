import 'dart:io';
import 'package:karteikartenapp/Speicherung/LokaleDatenbankKarteikarten.dart';
import 'package:karteikartenapp/Speicherung/LokaleDatenbankStapel.dart';
import 'package:karteikartenapp/Speicherung/Student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'Karteikarte.dart';
import 'Stapel.dart';
import 'Student.dart';
import 'Userdata.dart';


  class LokaleDatenbankKonto{

  static final tabelle = 'Konto';


  static Userdata userdata = new Userdata();

  static final colId = '_id';
  static final colUsername = 'username';
  static final colPassword = 'password';




  static Future _onCreate(Database db) async {
  await db.execute('''
          CREATE TABLE $tabelle (
            $colId INTEGER PRIMARY KEY,
            $colUsername TEXT NOT NULL,
            $colPassword Text NOT NULL
          )
          ''');
  }

  static void insertKonto(Student s) async {
  try {
  Database db = await LokaleDatenbankStapel.instance.database;
  delete(db);
  LokaleDatenbankKonto._onCreate(db);
  // row to insert
  Map<String, dynamic> row = getRowFromStudent(s);
  final id = await db.insert(tabelle, row);
  print('inserted row id: $id');
  }
  catch(e){}
  }
  static Future<Student> getKonto() async {
  try {
  var allRows = await LokaleDatenbankStapel.queryAllRows(tabelle);
  return Student.StudentfromMapObject(allRows[0]);
  }
  catch (e){}
  }
  static Future<int> delete(Database db) async {
  db.rawQuery('DROP TABLE IF EXISTS $tabelle');
  print('deleted table $tabelle');
  }
  static Map<String, dynamic> getRowFromStudent(Student s){
  Map<String, dynamic> row = {
  LokaleDatenbankKonto.colUsername : s.getUsername(),
  LokaleDatenbankKonto.colPassword : s.getPassword()
  };
  return row;
  }


  static void deleteKonto() async {
    Database db = await LokaleDatenbankStapel.instance.database;
    db.rawQuery('DROP TABLE IF EXISTS $tabelle');
    print('deleted table $tabelle');
  }



}