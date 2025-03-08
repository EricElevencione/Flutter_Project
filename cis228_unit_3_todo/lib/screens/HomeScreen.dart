import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // list of tasks to be displayed
  List<String> tasks = [];

  void _addTask() async {
    // Use this function to add the new task to the list
    // Create an ElevatedButton or FloatingActionButton to handle this

    // Finish the pushNamed function so that it will navigate to the
    // AddTaskScreen
    final newTask = await Navigator.pushNamed();

    setState(() {
      tasks.add(newTask as String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To-Do List")),

      // Add a ListView here that will display the task items
      // If we are basing our list on an array of items, it is best
      // to use ListView.builder
      body: ListView.builder(
                itemCount: ,
                itemBuilder: (context, index) {
                  return Container()
                },
              ),
    );
  }
}
