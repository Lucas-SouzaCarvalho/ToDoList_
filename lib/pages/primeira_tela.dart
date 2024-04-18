import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/pages/segunda_tela.dart';
import 'package:to_do_app/provider/task_provider.dart';
import 'package:to_do_app/util/todo_tile.dart';

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({Key? key}) : super(key: key);

  @override
  State<PrimeiraTela> createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  List toDoList = [];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

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
        builder: (context, TaskProvider provider, child) => ListView.builder(
          itemCount: provider.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              nomeTarefa: provider.toDoList.elementAt(index).title,
              feito: provider.toDoList.elementAt(index).done,
              onChanged: (value) {},
              onDismissed: () {},
            );
          },
        ),
      ),
    );
  }
}
