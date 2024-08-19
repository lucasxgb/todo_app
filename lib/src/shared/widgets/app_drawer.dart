import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/home/viewmodel/home_store.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  HomeStore? controller;

  @override
  void initState() {
    controller = Provider.of<HomeStore>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final AppLocalizations text = AppLocalizations.of(context)!;

    // final AppLocalizations text = AppLocalizations.of(context)!;
    return Drawer(
      backgroundColor: colorScheme.background,
      child: Column(
        children: [
          AppBar(
            backgroundColor: colorScheme.background,
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: Text(
              "To do",
              style: textTheme.titleMedium,
            ),
            subtitle: Text(
              'v 1.0',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall!
                  .copyWith(color: colorScheme.secondary.withOpacity(0.8)),
            ),
          ),
          InkWell(
            onTap: () {
              controller!.toggleMode();
            },
            child: ListTile(
              leading: const InkWell(
                child: Icon(Icons.color_lens),
              ),
              title: Text(
                text.toggleTheme,
                style: textTheme.titleMedium,
              ),
              subtitle: Text(
                text.clickToChangeTheme,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall!
                    .copyWith(color: colorScheme.secondary.withOpacity(0.8)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
