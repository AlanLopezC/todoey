import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskName = '';

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 24,
            left: 40,
            right: 40,
            // ? to see it from above keyboard, aldo needed to add SingleScrollView
            // ? as parent and is ScrolledControlled to true.
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              onChanged: (value) {
                newTaskName = value;
              },
              autofocus: true,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.bottom,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: MaterialButton(
                height: 50,
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                onPressed: () {
                  if (newTaskName != '') {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskName);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
