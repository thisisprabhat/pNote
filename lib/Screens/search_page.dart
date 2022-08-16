import 'package:flutter/material.dart';
import 'package:pnote/Screens/add_note_page.dart';
import 'package:pnote/Screens/edit_note_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const routeName = 'searchPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: const AddNote(),);
  }
}