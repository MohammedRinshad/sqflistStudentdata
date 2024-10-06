import 'package:hive_flutter/model/student_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



class DataBaseHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Student.db');
    var db = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return db;
  }

  _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE student(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT NOT NULL,
        age TEXT NOT NULL
      )
      '''); // Removed trailing comma and extra parenthesis
  }

  Future<StudentProvModel> insert(StudentProvModel studentModel) async {
    var dbClient = await db;
    await dbClient?.insert('student', studentModel.toMap());
    return studentModel;
  }

  Future<List<StudentProvModel>> getDataList() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> queryResult =
    await dbClient!.rawQuery("SELECT * FROM student");
    return queryResult.map((e) => StudentProvModel.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('student', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(StudentProvModel studentModel) async {
    var dbClient = await db;
    return await dbClient!.update('student', studentModel.toMap(),
        where: 'id = ?', whereArgs: [studentModel.id]);
  }
}
