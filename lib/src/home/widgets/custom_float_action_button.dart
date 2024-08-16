// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomFloatActionButton extends StatelessWidget {
  final void Function() onPressed;
  const CustomFloatActionButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return FloatingActionButton(
      elevation: 1.0,
      backgroundColor: colorScheme.primary,
      shape: const CircleBorder(),
      onPressed: () {
        onPressed();
      },
      child: Icon(
        Icons.add_rounded,
        color: colorScheme.secondary,
      ),
    );
  }
}
