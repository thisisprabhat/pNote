import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key,required this.title}) : super(key: key);



  final String title;

  static const routeName = 'notePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Hero(tag:'NoteTitle',child:  Text(title)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.back_hand),
      ),
      // body: AdvancedExample1(),
    );
  }
}

