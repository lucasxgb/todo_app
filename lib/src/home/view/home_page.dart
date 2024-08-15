import 'package:flutter/material.dart';
import 'package:todo_app/src/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:todo_app/src/home/widgets/custom_display_task_card.dart';
import 'package:todo_app/src/home/widgets/custom_float_action_button.dart';
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
        extendBody: true,
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: constraints.maxHeight * 0.49,
                        child: const CustomDisplayCardTask(
                          label: "A fazer",
                        )),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.49,
                      child: const CustomDisplayCardTask(
                        label: 'Concluída',
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
