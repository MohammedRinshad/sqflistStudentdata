import 'package:flutter/material.dart';
import 'package:hive_flutter/model/student_model.dart';
import 'package:hive_flutter/provider/studentList_provider.dart';
import 'package:provider/provider.dart';

class StudentListWidget extends StatelessWidget {
  const StudentListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(builder: (context, studentProv, child) {
      List<StudentProvModel> studentList = studentProv.todoList;
      if (studentList.isEmpty) {
        return const Center(
            child: Text(
          'No students added yet',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ));
      } else {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: 100,
                child: ListTile(
                  title: Text(
                    data.name.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: Text(
                    data.age.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: GestureDetector(
                      onTap: () async {
                        studentProv.deleteTask(data.id!.toInt());
                      },
                      child: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      )),
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      }
    });
  }
}
