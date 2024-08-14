import 'package:flutter/material.dart';
import 'package:todo_app/src/shared/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Todo',
            style: textTheme.titleMedium,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Olá mundo',
          style: textTheme.bodyMedium,
        ),
      ),
    );
  }
}
