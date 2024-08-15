import 'package:flutter/material.dart';

class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return FloatingActionButton(
      elevation: 1.0,
      backgroundColor: colorScheme.primary,
      shape: const CircleBorder(),
      onPressed: () {},
      child: Icon(
        Icons.add_rounded,
        color: colorScheme.secondary,
      ),
    );
  }
}
