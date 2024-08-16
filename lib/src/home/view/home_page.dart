import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/home/viewmodel/home_store.dart';
import 'package:todo_app/src/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:todo_app/src/home/widgets/custom_display_task_card.dart';
import 'package:todo_app/src/home/widgets/custom_float_action_button.dart';
import 'package:todo_app/src/home/widgets/task_bottom_sheet.dart';
import 'package:todo_app/src/shared/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore? controller;

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: const TaskBottomSheet());
        });
  }

  @override
  void initState() {
    controller = Provider.of<HomeStore>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        // extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomFloatActionButton(
          onPressed: () => _openTransactionFormModal(context),
        ),
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
                  child: Observer(builder: (_) {
                    return Column(
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
                          tasksList: controller!.pendingTaskList,
                          controller: controller,
                          constraints: constraints,
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
                            tasksList: controller!.completedTaskList,
                            controller: controller,
                            constraints: constraints,
                          ),
                        )
                      ],
                    );
                  })),
            );
          },
        ));
  }
}
