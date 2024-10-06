import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/lib/Model/student_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
void addStudentDetails(StudentModel value) {
  studentListNotifier.value = List.from(studentListNotifier.value)..add(value);
  //studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}
