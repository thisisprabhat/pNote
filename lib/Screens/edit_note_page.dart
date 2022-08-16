import 'package:flutter/material.dart';
import 'package:pnote/Themes/theme_switcher.dart';

class EditNote extends StatelessWidget {
  const EditNote({Key? key}) : super(key: key);

  static const routeName = 'editeNotePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Color Scheme Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SchemeColorBox(
                label: 'Primary',
                color: Theme.of(context).colorScheme.primary,
              ),
              SchemeColorBox(
                label: 'Secondary',
                color: Theme.of(context).colorScheme.secondary,
              ),
              SchemeColorBox(
                label: 'Tertiary',
                color: Theme.of(context).colorScheme.tertiary,
              ),
              SchemeColorBox(
                  label: "On Primary",
                  color: Theme.of(context).colorScheme.onPrimary)
            ],
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const SizedBox(height: 300, child: ThemeSwitcher());
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              );
            },
            child: const Text("Show Model Bottom Sheet"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SchemeColorBox extends StatelessWidget {
  final String label;
  final Color color;

  const SchemeColorBox({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(label),
            Container(
              color: color,
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}
