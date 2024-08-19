import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        child: Consumer<HomeStore>(
            builder: (_, HomeStore controller, __) => Observer(builder: (_) {
                  return MaterialApp(
                    title: 'Todo App',
                    debugShowCheckedModeBanner: false,
                    themeMode: controller.mode == false
                        ? ThemeMode.light
                        : ThemeMode.dark,
                    theme: GlobalThemeData.lightThemeData,
                    darkTheme: GlobalThemeData.darkThemeData,

                    home: const HomePage(),
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    // debugShowCheckedModeBanner: false,
                  );
                })));
  }
}
