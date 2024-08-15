import 'package:flutter/material.dart';
import 'package:todo_app/src/shared/widgets/custom_button.dart';
import 'package:todo_app/src/shared/widgets/custom_textformfield.dart';

class TaskBottomSheet extends StatelessWidget {
  const TaskBottomSheet({super.key});

  double setSize(constraints, value) {
    return constraints * (value / constraints);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: setSize(constraints.maxHeight, 16)),
            child: Column(
              children: [
                Container(
                  width: setSize(constraints.maxWidth, 44),
                  height: setSize(constraints.maxHeight, 4),
                  decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          maxLines: 1,
                          expands: false,
                          hintText: 'Título da tarefa',
                          controller: titleController,
                        ),
                        SizedBox(height: setSize(constraints.maxHeight, 8)),
                        SizedBox(
                          height: constraints.maxHeight * 3,
                          child: CustomTextFormField(
                            expands: true,
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.top,
                            hintText: "Descreva o título da tarefa",
                            controller: descriptionController,
                          ),
                        ),
                        SizedBox(height: setSize(constraints.maxHeight, 8)),
                        CustomElevatedButton(
                          backgroundColor: colorScheme.primary,
                          textColor: colorScheme.secondary,
                          text: 'Adicionar Nota',
                          onPressed: () {},
                        ),
                      ],
                    ))
              ],
            ),
          );
        }),
      ),
    );
  }
}
