import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.text,
    required this.isChecked,
    required this.checkboxCallback,
    required this.dismissCallback,
  });

  final bool isChecked;
  final String text;
  final checkboxCallback;
  final dismissCallback;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(text),
      dismissal: SlidableDismissal(
        dismissThresholds: <SlideActionType, double>{
          SlideActionType.primary: 1.0,
          SlideActionType.secondary: 0.40,
        },
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) => dismissCallback(),
      ),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          icon: Icons.delete,
          onTap: dismissCallback,
        ),
      ],
      child: CheckboxListTile(
        title: Text(
          text,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
