import 'package:flutter/material.dart';
import 'package:pnote/Themes/theme_switcher.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  static const routeName = 'AddNotePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: double.infinity,
          color: Colors.white24,
          child: const Center(
            child: ThemeSwitcher(),
          ),
        ),
      ),
    );
  }
}
