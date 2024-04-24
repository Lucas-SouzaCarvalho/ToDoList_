import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/task_provider.dart';

class ToDoTile extends StatelessWidget {
  final Task task;

  ToDoTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<TaskProvider>(context, listen: false).deleteTask(task);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Container(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                Checkbox(
                  value: task.done,
                  onChanged: (value) {
                    Provider.of<TaskProvider>(context, listen: false)
                        .toggleTaskCompletion(task);
                  },
                  activeColor: Color(0XFF454545),
                ),
                Text(task.title,
                    style: TextStyle(
                        decoration: task.done
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: Color(0XFF454545),
                        decorationThickness: 4.0))
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0XFF0085ff),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
