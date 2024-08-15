import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return BottomAppBar(
        // notchMargin: 10,
        padding: EdgeInsets.zero,
        height: deviceHeight * 0.1,
        color: colorScheme.secondary,
        notchMargin: 4,
        shape: const CircularNotchedRectangle(),
        surfaceTintColor: colorScheme.secondary,
        elevation: 1,
        // shadowColor: colorScheme.primary,
        child: LayoutBuilder(
          builder: ((context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: BottomNavigationBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notes_rounded,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    label: "Task",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search_rounded,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                      label: "Search")
                ],
              ),
            );
          }),
        ));
  }
}
