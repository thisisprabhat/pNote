import 'package:flutter/material.dart';
import 'package:pnote/Screens/edit_note_page.dart';
import 'package:pnote/Themes/theme_switcher.dart';

import 'note_page.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   systemNavigationBarColor: Colors.pink, // navigation bar color
    //   // systemNavigationBarColor: Theme.of(context).colorScheme.background,
    //   statusBarColor: Colors.red, // status bar color
    //   statusBarBrightness: Brightness.light, //status bar brigtness
    //   statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    //   systemNavigationBarDividerColor:
    //       Colors.blue, //Navigation bar divider color
    //   systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
    // ));



    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Note'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=>showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const SizedBox(height: 300, child: ThemeSwitcher());
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ), icon:const Icon(Icons.model_training_sharp)),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, SearchPage.routeName),
            
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const Drawer(
        child: Text('App Drawer'),
        // child: ThemeSwitcher(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, EditNote.routeName),
        child: const Icon(Icons.add),
      ),
      body:const FolderGrid(),
    );
  }
}

class FolderGrid extends StatelessWidget {
  const FolderGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 3.0,
      mainAxisSpacing: 3.0,
      children: List.generate(30, (index) {
        return Center(
          child: box(context, "box $index"),
        );
      }),
    );
  }

  Widget box(context, title) => GridTile(
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => NotePage(title: title)),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      );
}