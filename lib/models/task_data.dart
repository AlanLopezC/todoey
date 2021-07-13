import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Run'),
    Task(name: 'Swim'),
    Task(name: 'Eat'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void toggleDone(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void addTask(String newTaskName) {
    _tasks.add(Task(name: newTaskName));
    notifyListeners();
  }

  void dismissTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
