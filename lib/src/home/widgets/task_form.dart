// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/home/viewmodel/home_store.dart';
import 'package:todo_app/src/shared/models/task_model.dart';
import 'package:todo_app/src/shared/res/responsive.dart';
import 'package:todo_app/src/shared/widgets/custom_button.dart';
import 'package:todo_app/src/shared/widgets/custom_textformfield.dart';

class TaskForm extends StatefulWidget {
  final BoxConstraints constraints;
  const TaskForm({
    super.key,
    required this.constraints,
  });

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();

  HomeStore? controller;

  @override
  void initState() {
    controller = Provider.of<HomeStore>(context, listen: false);
    controller!.resetParameters();
    super.initState();
  }

  _onPressed() async {
    await controller!.addTaskInList(TaskModel(
        title: controller!.title!,
        description: controller!.description!,
        date: controller!.date!,
        completed: false));
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Observer(builder: (_) {
      return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                maxLines: 1,
                expands: false,
                hintText: 'Título da tarefa',
                controller: titleController,
                onChanged: controller!.setTitle,
              ),
              SizedBox(height: setSize(widget.constraints.maxHeight, 8)),
              SizedBox(
                height: widget.constraints.maxHeight * .3,
                child: CustomTextFormField(
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                  hintText: "Descreva o título da tarefa",
                  controller: descriptionController,
                  onChanged: controller!.setDescription,
                ),
              ),
              SizedBox(height: setSize(widget.constraints.maxHeight, 8)),
              CustomTextFormField(
                maxLines: 1,
                expands: false,
                readonly: true,
                hintText: 'Selecione a data',
                controller: dateController,
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2024, 12, 12),
                    fieldLabelText: "Selecione a data",
                  ).then((pickedDate) {
                    if (pickedDate == null) {
                      dateController.text =
                          DateFormat("dd/MM/yyyy").format(DateTime.now());
                    }
                    dateController.text = DateFormat("dd/MM/yyyy")
                        .format(pickedDate ?? DateTime.now());
                  });
                },
                onChanged: controller!.setDateTime,
                suffixIcon: Icon(
                  Icons.calendar_month,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: setSize(widget.constraints.maxHeight, 16)),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomElevatedButton(
                  backgroundColor: colorScheme.primary,
                  textColor: colorScheme.secondary,
                  text: 'Adicionar tarefa',
                  onPressed: _onPressed,
                ),
              ),
            ],
          ));
    });
  }
}
