import 'package:flutter/material.dart';
import 'package:hive_flutter/provider/addData_provider.dart';
import 'package:hive_flutter/provider/studentList_provider.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProvider>(builder: (context, addProvider, _) {
      return InkWell(
        onTap: () async {
          addProvider.addTask();
          context.read<StudentProvider>().loadData();
          //addProvider.addStudent();
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: const Center(
              child: Text(
            "Add",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          )),
        ),
      );
    });
  }
}
