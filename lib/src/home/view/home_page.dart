import 'package:flutter/material.dart';
import 'package:todo_app/src/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:todo_app/src/home/widgets/custom_display_task_card.dart';
import 'package:todo_app/src/home/widgets/custom_float_action_button.dart';
import 'package:todo_app/src/shared/models/task_model.dart';
import 'package:todo_app/src/shared/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        // extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const CustomFloatActionButton(),
        bottomNavigationBar: const CustomBottomNavigationBar(),
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "A fazer",
                      style: textTheme.titleSmall,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    SizedBox(
                        child: CustomDisplayCardTask(
                      label: "A fazer",
                      tasksList: [
                        TaskModel(
                            title: "Estudar flutter essa semana toda",
                            description: 'mundo',
                            date: DateTime.now(),
                            completed: false),
                        TaskModel(
                            title: "ola",
                            description: 'mundo',
                            date: DateTime.now(),
                            completed: false),
                        TaskModel(
                            title: "ola",
                            description: 'mundo',
                            date: DateTime.now(),
                            completed: false),
                        TaskModel(
                            title: "Estudar flutter essa semana toda",
                            description: 'mundo',
                            date: DateTime.now(),
                            completed: false),
                        TaskModel(
                            title: "ola",
                            description: 'mundo',
                            date: DateTime.now(),
                            completed: false),
                        TaskModel(
                            title: "ola",
                            description: 'mundo',
                            date: DateTime.now(),
                            completed: false),
                      ],
                    )),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    Text(
                      "Concluída",
                      style: textTheme.titleSmall,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    SizedBox(
                      child: CustomDisplayCardTask(
                        label: 'Concluída',
                        tasksList: [
                          TaskModel(
                              title: "ola",
                              description: 'mundo',
                              date: DateTime.now(),
                              completed: true),
                          TaskModel(
                              title: "ola",
                              description: 'mundo',
                              date: DateTime.now(),
                              completed: true),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
