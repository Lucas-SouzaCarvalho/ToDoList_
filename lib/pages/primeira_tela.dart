import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/task_provider.dart';
import 'package:to_do_app/util/todo_tile.dart';
import 'package:to_do_app/pages/segunda_tela.dart'; // Import the TaskFormPage

class PrimeiraTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1E1E1E),
      appBar: AppBar(
        title: const Text('Lembretes'),
        centerTitle: true,
        backgroundColor: const Color(0XFF0085ff),
        elevation: 10,
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskFormPage()),
          );
        },
        child: Icon(
          Icons.add,
          color: Color(0XFF0085ff),
        ),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          final toDoList = taskProvider.toDoList;
          return ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              final task = toDoList[index];
              return ToDoTile(
                task: task,
              );
            },
          );
        },
      ),
    );
  }
}
