import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _toDoList = [];

  List<Task> get toDoList => _toDoList;

  set toDoList(List<Task> value) {
    _toDoList = value;
  }

  addTask(Task task) {
    _toDoList.add(task);
    notifyListeners();
  }
}
