// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/src/home/viewmodel/home_store.dart';
import 'package:todo_app/src/home/widgets/task_bottom_sheet.dart';
import 'package:todo_app/src/shared/models/task_model.dart';
import 'package:todo_app/src/shared/res/enums/location_task.dart';
import 'package:todo_app/src/shared/res/enums/viewmode.dart';
import 'package:todo_app/src/shared/widgets/card_task.dart';

class CustomDisplayCardTask extends StatelessWidget {
  final List<TaskModel>? tasksList;
  final HomeStore? controller;
  final BoxConstraints constraints;
  final LocationTask location;
  final void Function(BuildContext, String, TextStyle) showSnack;

  const CustomDisplayCardTask({
    super.key,
    this.tasksList,
    this.controller,
    required this.constraints,
    required this.location,
    required this.showSnack,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final AppLocalizations text = AppLocalizations.of(context)!;

    openTransactionFormModal(BuildContext context, TaskModel task) {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (_) {
            return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: TaskBottomSheet(
                  viewMode: ViewMode.edit,
                  task: task,
                ));
          });
    }

    return Observer(builder: (_) {
      return tasksList!.isNotEmpty
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
                return Dismissible(
                  key: Key("${tasksList!.length}"),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) async {
                    if (location == LocationTask.pending) {
                      await controller!.removeTaskList(tasksList![index]);
                    } else {
                      await controller!
                          .removeCompletedTaskList(tasksList![index]);
                    }
                    if (context.mounted) {
                      showSnack(
                          context,
                          text.taskDeleted,
                          textTheme.labelSmall!
                              .copyWith(color: colorScheme.onPrimary));
                    }
                  },
                  background: Container(
                    color: colorScheme.error,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.delete,
                        color: colorScheme.onError,
                      ),
                    ),
                  ),
                  child: InkWell(
                    child: CardTask(
                      task: tasksList![index],
                      index: index,
                      location: location,
                    ),
                    onTap: () {
                      openTransactionFormModal(context, tasksList![index]);
                    },
                  ),
                );
              }),
            )
          : Container(
              height: constraints.maxHeight * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colorScheme.primary.withOpacity(0.1)),
              child: Center(
                child: Text(
                  text.noTasksFound,
                  style: textTheme.bodyMedium,
                ),
              ),
            );
    });
  }
}
