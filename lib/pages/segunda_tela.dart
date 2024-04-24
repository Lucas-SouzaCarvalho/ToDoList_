import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/provider/task_provider.dart';

class TaskFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1E1E1E),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('Adicionar Tarefa'),
        backgroundColor: const Color(0XFF0085ff),
        elevation: 10,
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      body: TaskForm(),
    );
  }
}

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Título',
              labelStyle: TextStyle(color: Color(0XFF0085ff)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF0085ff)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF0085ff)),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _bodyController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Digite aqui',
                labelStyle: TextStyle(color: Color(0XFF0085ff)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF0085ff)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF0085ff)),
                ),
              ),
              maxLines: 30,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _saveTask(context);
              },
              child: Text('Save', style: TextStyle(color: Color(0XFF0085ff))),
            ),
          ),
        ],
      ),
    );
  }

  void _saveTask(BuildContext context) {
    String title = _titleController.text.trim();
    String body = _bodyController.text.trim();

    if (title.isNotEmpty && body.isNotEmpty) {
      Task newTask = Task(title: title, body: body);
      Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Por favor não deixe campos em branco',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}
