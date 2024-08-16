// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/src/shared/models/task_model.dart';
import 'package:todo_app/src/shared/widgets/custom_checkbox.dart';

class CardTask extends StatelessWidget {
  final TaskModel task;
  const CardTask({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        // margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.12),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  CustomCheckBox(completed: task.completed),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      task.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          letterSpacing: 0.2,
                          decoration: task.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  DateFormat("dd MMM yyyy",
                          Localizations.localeOf(context).languageCode)
                      .format(task.date),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall,
                ),
              ],
            )
          ],
        ));
  }
}
