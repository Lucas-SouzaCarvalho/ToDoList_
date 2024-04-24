import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _toDoList = [];

  List<Task> get toDoList => _toDoList;

  set toDoList(List<Task> value) {
    _toDoList = value;
  }

  void addTask(Task task) {
    _toDoList.add(task);
    notifyListeners();
  }

  void toggleTaskCompletion(Task task) {
    final index = _toDoList.indexOf(task);
    if (index != -1) {
      _toDoList[index].done = !_toDoList[index].done;
      notifyListeners();
    }
  }

  void deleteTask(Task task) {
    _toDoList.remove(task);
    notifyListeners();
  }
}
