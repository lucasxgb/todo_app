// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/src/shared/models/card_taks_model.dart';

class CustomDisplayCardTask extends StatelessWidget {
  final String label;
  final List<CardTaskModel>? tasksList;

  const CustomDisplayCardTask({
    super.key,
    required this.label,
    this.tasksList,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: ((context, constraints) {
        return tasksList != null
            ? Column(
                children: [
                  Text(
                    label,
                    style: textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  ListView.builder(
                    itemCount: tasksList!.length,
                    // separatorBuilder: (context, index) {},
                    itemBuilder: ((context, index) {
                      return null;
                    }),
                  )
                ],
              )
            : Container(
                // height: constraints.maxHeight * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorScheme.primary.withOpacity(0.1)),
                child: Center(
                  child: Text(
                    'Não foram encontradas tarefas',
                    style: textTheme.bodyMedium,
                  ),
                ),
              );
      }),
    );
  }
}
