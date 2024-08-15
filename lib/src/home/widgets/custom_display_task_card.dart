// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/src/shared/models/task_model.dart';
import 'package:todo_app/src/shared/widgets/card_task.dart';

class CustomDisplayCardTask extends StatelessWidget {
  final String label;
  final List<TaskModel>? tasksList;

  const CustomDisplayCardTask({
    super.key,
    required this.label,
    this.tasksList,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return tasksList != null
        ? ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: tasksList!.length,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: index != tasksList!.length ? 8 : 0,
              );
            },
            itemBuilder: ((context, index) {
              return CardTask(task: tasksList![index]);
            }),
          )
        : Container(
            // height: constraints.maxHeight * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorScheme.primary.withOpacity(0.1)),
            child: Center(
              child: Text(
                'Nenhuma tarefa encontrada',
                style: textTheme.bodyMedium,
              ),
            ),
          );
  }
}
