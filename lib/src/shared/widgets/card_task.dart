// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/home/viewmodel/home_store.dart';
import 'package:todo_app/src/shared/models/task_model.dart';
import 'package:todo_app/src/shared/res/enums/location_task.dart';
import 'package:todo_app/src/shared/widgets/custom_checkbox.dart';

class CardTask extends StatefulWidget {
  final TaskModel task;
  final int index;
  final LocationTask location;
  const CardTask(
      {super.key,
      required this.task,
      required this.index,
      required this.location});

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
  HomeStore? controller;

  @override
  void initState() {
    controller = Provider.of<HomeStore>(context, listen: false);
    controller!.resetParameters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Observer(builder: (_) {
      return Container(
          // margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.12),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              backgroundColor: colorScheme.primary,
                              child: Text(
                                '${widget.index + 1}',
                                style: textTheme.titleLarge!.copyWith(
                                  fontSize: 18,
                                  color: colorScheme.onPrimary,
                                  decoration: widget.task.completed
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  decorationColor:
                                      colorScheme.primary.withOpacity(0.9),
                                  decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.task.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyMedium!.copyWith(
                                      fontSize: 16,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.bold,
                                      decoration: widget.task.completed
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                      decorationColor: colorScheme.secondary
                                          .withOpacity(0.9),
                                      decorationStyle:
                                          TextDecorationStyle.solid),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      DateFormat(
                                              "dd MMM yyyy",
                                              Localizations.localeOf(context)
                                                  .languageCode)
                                          .format(widget.task.date!),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodySmall!.copyWith(
                                          color: colorScheme.secondary
                                              .withOpacity(0.8)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Transform.scale(
                      scale: 1.4,
                      child: CustomCheckBox(
                        task: widget.task,
                        onChanged: (_) => controller!
                            .setCompleted(widget.task, widget.location),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
    });
  }
}
