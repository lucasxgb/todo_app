// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/src/home/viewmodel/home_store.dart';
import 'package:todo_app/src/home/widgets/task_bottom_sheet.dart';
import 'package:todo_app/src/shared/models/task_model.dart';
import 'package:todo_app/src/shared/res/enums/viewmode.dart';
import 'package:todo_app/src/shared/widgets/card_task.dart';

class CustomDisplayCardTask extends StatelessWidget {
  final List<TaskModel>? tasksList;
  final HomeStore? controller;
  final BoxConstraints constraints;

  const CustomDisplayCardTask({
    super.key,
    this.tasksList,
    this.controller,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

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
              return InkWell(
                child: CardTask(task: tasksList![index]),
                onTap: () {
                  openTransactionFormModal(context, tasksList![index]);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (_) => DisplayTaskDetails(
                  //         task: tasksList![index],
                  //       ),
                  //     ));
                },
              );
            }),
          )
        : Container(
            height: constraints.maxHeight * 0.2,
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
