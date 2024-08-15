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
    return SizedBox(
      height: 16,
      width: 16,
      child: Checkbox(
        value: completed,
        fillColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        checkColor: Theme.of(context).colorScheme.secondary,
        activeColor: Theme.of(context).colorScheme.primary,
        onChanged: (bool? value) {},
      ),
    );
  }
}
