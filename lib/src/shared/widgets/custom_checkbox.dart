// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/src/shared/models/task_model.dart';

class CustomCheckBox extends StatelessWidget {
  final void Function(TaskModel)? onChanged;
  final TaskModel task;
  const CustomCheckBox({
    super.key,
    required this.task,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 16,
      width: 16,
      child: Checkbox(
        value: task.completed,
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (!states.contains(MaterialState.selected)) {
            return null;
          } else {
            return colorScheme.primary;
          }
        }),

        // MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        checkColor: colorScheme.secondary,
        activeColor: colorScheme.primary,

        onChanged: (_) {
          onChanged!(task);
        },
      ),
    );
  }
}
