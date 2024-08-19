import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/home/viewmodel/home_store.dart';
import 'package:todo_app/src/home/widgets/custom_display_task_card.dart';
import 'package:todo_app/src/home/widgets/custom_float_action_button.dart';
import 'package:todo_app/src/home/widgets/task_bottom_sheet.dart';
import 'package:todo_app/src/shared/res/enums/location_task.dart';
import 'package:todo_app/src/shared/res/enums/viewmode.dart';
import 'package:todo_app/src/shared/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore? controller;

  _openTransactionFormModal(
    BuildContext context,
  ) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: const TaskBottomSheet(viewMode: ViewMode.view));
        });
  }

  @override
  void initState() {
    controller = Provider.of<HomeStore>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void showSnackBar(BuildContext context , String text, TextStyle textStyle) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(text, style:textStyle, ),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    final TextTheme textTheme = Theme.of(context).textTheme;
    final AppLocalizations text = AppLocalizations.of(context)!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    

    return Scaffold(
        // extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: CustomFloatActionButton(
          onPressed: () => _openTransactionFormModal(context),
        ),
        // bottomNavigationBar: const CustomBottomNavigationBar(),
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: colorScheme.background,
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "To do",
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
                          text.toDo,
                          style: textTheme.titleSmall!.copyWith(
                              color: colorScheme.secondary.withOpacity(0.9)),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        SizedBox(
                            child: CustomDisplayCardTask(
                                tasksList: controller!.pendingTaskList,
                                controller: controller,
                                constraints: constraints,
                                location: LocationTask.pending,
                                showSnack: showSnackBar)),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Text(
                          text.completed,
                          style: textTheme.titleSmall!.copyWith(
                              color: colorScheme.secondary.withOpacity(0.9)),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        SizedBox(
                          child: CustomDisplayCardTask(
                              tasksList: controller!.completedTaskList,
                              controller: controller,
                              constraints: constraints,
                              location: LocationTask.completed,
                              showSnack: showSnackBar),
                        )
                      ],
                    );
                  })),
            );
          },
        ));
  }
}
