import 'package:flutter/material.dart';
import 'package:todo_app/src/home/widgets/task_form.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  double setSize(constraints, value) {
    return constraints * (value / constraints);
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final deviceInfo = MediaQuery.of(context);
    final deviceHeight = deviceInfo.size.height - deviceInfo.padding.top;

    return ClipRRect(
      child: Container(
        height: deviceHeight * 0.5,
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: setSize(constraints.maxHeight, 24),
                vertical: setSize(constraints.maxWidth, 8)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: setSize(constraints.maxWidth, 16),
                    bottom: setSize(constraints.maxWidth, 16),
                  ),
                  child: Container(
                    width: setSize(constraints.maxWidth, 44),
                    height: setSize(constraints.maxHeight, 4),
                    decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: setSize(constraints.maxWidth, 16),
                  ),
                  child: Text(
                    'Adicione sua tarefa',
                    style: textTheme.bodyMedium,
                  ),
                ),
                TaskForm(constraints: constraints)
              ],
            ),
          );
        }),
      ),
    );
  }
}
