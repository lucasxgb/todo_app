import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/home/view/home_page.dart';
import 'package:todo_app/src/home/viewmodel/home_store.dart';
import 'package:todo_app/src/shared/res/global_theme_data.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<HomeStore>(create: (_) => HomeStore())],
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: GlobalThemeData.lightThemeData,
        darkTheme: GlobalThemeData.darkThemeData,
        home: const HomePage(),
      ),
    );
  }
}
