import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_form_sheet.dart';
import '../models/task.dart';
import '../db/database_helper.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  Future loadTasks() async {
    tasks = await DatabaseHelper.instance.getAll();
    notifyListeners();
  }

  Future addTask(Task t) async {
    await DatabaseHelper.instance.insert(t);
    await loadTasks();
  }

  Future updateTask(Task t) async {
    await DatabaseHelper.instance.update(t);
    await loadTasks();
  }

  Future deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);
    await loadTasks();
  }

  List<Task> byStatus(String status) =>
      tasks.where((t) => t.status == status).toList();

  void openForm(BuildContext context, [Task? t]) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: TaskFormSheet(task: t),
      ),
    );
  }
}
