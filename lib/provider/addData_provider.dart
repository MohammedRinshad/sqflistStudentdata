import 'package:flutter/material.dart';
import 'package:hive_flutter/model/student_model.dart';
import '../database/db_handler.dart';

class UpdateProvider extends ChangeNotifier {
  final DataBaseHelper _dbHelper = DataBaseHelper();

  Future<List<StudentProvModel>> getDataList() async {
    return await _dbHelper.getDataList();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  // Add a new task
  Future<void> addTask() async {
    if (nameController.text.isNotEmpty && ageController.text.isNotEmpty) {
      await _dbHelper.insert(StudentProvModel(
        name: nameController.text,
        age: ageController.text,
      ));
      clearFields();
      notifyListeners();
    }
  }

  Future<void> updateTask(StudentProvModel studentModel) async {
    if (nameController.text.isNotEmpty && ageController.text.isNotEmpty) {
      StudentProvModel updatedTodo = StudentProvModel(
        id: studentModel.id, // Ensure you pass the existing task ID
        name: nameController.text,
        age: ageController.text,
      );
      await _dbHelper.update(updatedTodo); // Call the update method
      clearFields();
      notifyListeners();
    }
  }

  // Clear the fields
  void clearFields() {
    nameController.clear();
    ageController.clear();
    notifyListeners();
  }

  // Load data for update
  void loadTaskData(String title, String desc) {
    nameController.text = title;
    ageController.text = desc;
    notifyListeners();
  }
}
