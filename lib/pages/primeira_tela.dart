import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/pages/segunda_tela.dart';
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
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskFormPage()),
          );

          if (result != null && result is Map<String, dynamic>) {
            setState(() {
              toDoList.add([result['title'], false]);
            });
          }
        },
        child: Icon(
          Icons.add,
          color: Color(0XFF0085ff),
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            nomeTarefa: toDoList[index][0],
            feito: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            onDismissed: () => deleteTask(index),
          );
        },
      ),
    );
  }
}
