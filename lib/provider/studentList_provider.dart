import 'package:flutter/material.dart';
import 'package:hive_flutter/model/student_model.dart';
import '../database/db_handler.dart';

class StudentProvider extends ChangeNotifier {
  DataBaseHelper dbHelper = DataBaseHelper();
  List<StudentProvModel> _todoList = [];

  List<StudentProvModel> get todoList => _todoList;

  Future<void> loadData() async {
    _todoList = await dbHelper.getDataList();
    notifyListeners();
  }

  Future<void> deleteTask(int id) async {
    await dbHelper.delete(id);
    await loadData();
  }
}
