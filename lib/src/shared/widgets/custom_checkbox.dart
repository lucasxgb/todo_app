// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final bool completed;
  const CustomCheckBox({
    super.key,
    this.onChanged,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 16,
      width: 16,
      child: Checkbox(
        value: completed,
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (!states.contains(MaterialState.selected)) {
            return null;
          } else {
            return colorScheme.primary;
          }
        }),

        // MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        checkColor: colorScheme.secondary,
        activeColor: colorScheme.primary,
        onChanged: (bool? value) {},
      ),
    );
  }
}
