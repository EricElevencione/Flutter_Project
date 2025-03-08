import 'package:cis228_unit_3_todo/screens/HomeScreen.dart';
import 'package:cis228_unit_3_todo/screens/AddTaskScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/addTask': (context) => AddTaskScreen(),
      },
    );
  }
}
