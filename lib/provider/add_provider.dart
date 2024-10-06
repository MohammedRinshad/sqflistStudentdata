import 'package:flutter/material.dart';
import 'package:hive_flutter/lib/Model/student_model.dart';
import 'package:hive_flutter/lib/db/db_functions.dart';

class AddProvider with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  void addStudent() {
    final name = nameController.text;
    final age = ageController.text;

    if (name.isEmpty || age.isEmpty) {
      return;
    }

    final student = StudentModel(name: name, age: age);

    addStudentDetails(student);

    nameController.clear();
    ageController.clear();

    notifyListeners();
  }
}
