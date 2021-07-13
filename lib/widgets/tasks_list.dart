import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, TaskData taskData, Widget? child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final Task task = taskData.tasks[index];
            return TaskTile(
              text: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkBoxState) {
                taskData.toggleDone(task);
              },
              dismissCallback: () {
                taskData.dismissTask(task);
              },
            );
          },
        );
      },
    );
  }
}
