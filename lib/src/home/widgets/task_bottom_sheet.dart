// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/home/viewmodel/home_store.dart';
import 'package:todo_app/src/home/widgets/task_form.dart';
import 'package:todo_app/src/shared/models/task_model.dart';
import 'package:todo_app/src/shared/res/enums/viewmode.dart';

class TaskBottomSheet extends StatefulWidget {
  final ViewMode viewMode;
  final TaskModel? task;
  const TaskBottomSheet({
    super.key,
    required this.viewMode,
    this.task,
  });

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();
  HomeStore? controller;

  double setSize(constraints, value) {
    return constraints * (value / constraints);
  }

  @override
  void initState() {
    controller = Provider.of<HomeStore>(context, listen: false);
    controller!.isEditable = false;
    super.initState();
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(Icons.close_rounded,
                            color: colorScheme.primary, size: 22),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        'Adicione sua tarefa',
                        style: textTheme.bodyMedium,
                      ),
                      if (widget.viewMode == ViewMode.edit)
                        Observer(builder: (_) {
                          return InkWell(
                            child: controller!.isEditable
                                ? Icon(Icons.check_rounded,
                                    color: colorScheme.primary, size: 22)
                                : Icon(
                                    Icons.edit_rounded,
                                    color: colorScheme.primary,
                                    size: 22,
                                  ),
                            onTap: () async {
                              if (controller!.isEditable == true) {
                                controller!.editTask(
                                    widget.task!,
                                    widget.task!.copyWith(
                                        title: titleController.text,
                                        description: descriptionController.text,
                                        date: DateTime.parse(
                                            dateController.text)));
                                controller!.setEditable();
                                Navigator.of(context).pop();
                              }
                            },
                          );
                        }),
                    ],
                  ),
                ),
                TaskForm(
                  constraints: constraints,
                  viewMode: widget.viewMode,
                  task: widget.task,
                  titleController: titleController,
                  dateController: dateController,
                  descriptionController: descriptionController,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
