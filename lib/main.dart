import 'package:flutter/material.dart';
import 'screens/task_list_screen.dart';
import '/screens/add_task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      initialRoute: '/',
      routes: {
        '/': (context) => TaskListScreen(),
        '/add': (context) => AddTaskScreen(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
    );
  }
}
