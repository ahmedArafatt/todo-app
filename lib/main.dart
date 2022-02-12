import 'package:flutter/material.dart';
import 'package:todo_app/modules/new_tasks.dart';
import 'package:todo_app/shared/data_base.dart';

void main() {
  //this line is important to make other lines execute with runApp() function , just use it  in main function
  WidgetsFlutterBinding.ensureInitialized();
  MyDatabase.onCreateDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'ToDo',
      home: NewTasks(),
    );
  }
}

