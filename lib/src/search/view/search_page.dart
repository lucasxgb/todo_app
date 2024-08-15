import 'package:flutter/material.dart';
import 'package:todo_app/src/shared/widgets/custom_textformfield.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        color: colorScheme.tertiary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Expanded(
            child: CustomTextFormField(
              hintText: "Search todo",
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                splashColor: Colors.transparent,
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              ),
              onSaved: (value) {},
            ),
          ),
        ),
      ),
    );
  }
}
