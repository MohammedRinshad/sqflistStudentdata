import 'package:flutter/material.dart';
import 'package:hive_flutter/provider/addData_provider.dart';
import 'package:hive_flutter/widgets/text_field.dart';
import 'package:provider/provider.dart';
import '../provider/studentList_provider.dart';
import '../widgets/button_widget.dart';
import '../widgets/student_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StudentProvider>().loadData();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Consumer<UpdateProvider>(builder: (context, addProvider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                TextFormFieldWidget(
                  controller: addProvider.nameController,
                  labelText: 'Name',
                ),
                const SizedBox(height: 10),
                TextFormFieldWidget(
                  controller: addProvider.ageController,
                  labelText: 'Age',
                ),
                const SizedBox(height: 10),
                // Button that triggers adding the student
                const ButtonWidget(),
                const SizedBox(height: 10),
                const Expanded(child: StudentListWidget()),
              ],
            );
          }),
        ),
      ),
    );
  }
}
