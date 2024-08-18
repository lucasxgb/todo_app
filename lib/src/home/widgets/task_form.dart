// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/src/home/viewmodel/home_store.dart';
import 'package:todo_app/src/shared/models/task_model.dart';
import 'package:todo_app/src/shared/res/enums/input_border_type.dart';
import 'package:todo_app/src/shared/res/enums/viewmode.dart';
import 'package:todo_app/src/shared/res/responsive.dart';
import 'package:todo_app/src/shared/widgets/custom_button.dart';
import 'package:todo_app/src/shared/widgets/custom_textformfield.dart';

class TaskForm extends StatefulWidget {
  final BoxConstraints constraints;
  final TextEditingController? titleController;
  final TextEditingController? dateController;
  final TextEditingController? descriptionController;
  final ViewMode? viewMode;
  final TaskModel? task;

  const TaskForm({
    super.key,
    required this.constraints,
    this.titleController,
    this.dateController,
    this.descriptionController,
    this.viewMode,
    this.task,
  });

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final formKey = GlobalKey<FormState>();
  HomeStore? controller;

  @override
  void initState() {
    controller = Provider.of<HomeStore>(context, listen: false);
    controller!.resetParameters();

    if (widget.task != null) {
      widget.titleController!.text = widget.task!.title;
      widget.descriptionController!.text = widget.task!.description!;
      widget.dateController!.text = DateFormat('yyyy-MM-dd').format(widget.task!.date!);
    }
    super.initState();
  }

  _onPressed() async {
    await controller!.addTaskInList(TaskModel(
        title: controller!.title!,
        description: controller!.description,
        date: controller!.date!,
        completed: false));
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Observer(builder: (_) {
      return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                borderType: InputBorderType.outline,
                maxLines: 1,
                expands: false,
                enabled: !controller!.isLoading || controller!.isEditable,
                hintText: 'Título da tarefa',
                controller: widget.titleController,
                onChanged: controller!.setTitle,
              ),
              SizedBox(height: setSize(widget.constraints.maxHeight, 8)),
              SizedBox(
                height: widget.constraints.maxHeight * .3,
                child: CustomTextFormField(
                  borderType: InputBorderType.outline,
                  expands: true,
                  enabled: !controller!.isLoading || controller!.isEditable,
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                  hintText: "Descreva a tarefa",
                  controller: widget.descriptionController,
                  onChanged: controller!.setDescription,
                ),
              ),
              SizedBox(height: setSize(widget.constraints.maxHeight, 8)),
              CustomTextFormField(
                borderType: InputBorderType.outline,
                maxLines: 1,
                expands: false,
                readonly: true,
                enabled: !controller!.isLoading || controller!.isEditable,
                hintText: 'Selecione a data',
                controller: widget.dateController,
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: widget.dateController!.text.isNotEmpty
                        ? DateTime.parse(widget.dateController!.text)
                        : DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2024, 12, 12),
                    fieldLabelText: "Selecione a data",
                  ).then((pickedDate) {
                    widget.dateController!.text = DateFormat('yyyy-MM-dd')
                        .format(pickedDate ?? DateTime.now());
                    controller!.setDateTime(widget.dateController!.text);
                  });
                },
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: controller!.isLoading
                      ? colorScheme.primary.withOpacity(0.2)
                      : colorScheme.primary,
                ),
              ),
              SizedBox(height: setSize(widget.constraints.maxHeight, 16)),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomElevatedButton(
                  backgroundColor: colorScheme.primary,
                  textColor: colorScheme.secondary,
                  text: controller!.isLoading
                      ? null
                      : widget.viewMode == ViewMode.edit
                          ? 'Adicionar tarefa'
                          : 'Concluir Alterações',
                  onPressed: () async {
                    await _onPressed();
                  },
                ),
              ),
            ],
          ));
    });
  }
}
