import 'package:flutter/material.dart';
import 'package:pnote/Themes/monet_colors.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';

import '../Screens/search_page.dart';
import '../Screens/folder_page.dart';
import '../Screens/note_page.dart';
import '../Screens/home_page.dart';
import '../Screens/edit_note_page.dart';
import '../Screens/add_note_page.dart';
import '../Provider/note_provider.dart';
import '../Provider/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NoteProvider(),
        ),
      ],
      child: const PNote(),
    ),
  );
}

class PNote extends StatelessWidget {
  const PNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          colorScheme:
              context.watch<ThemeProvider>().getTheme == CustomTheme.monet
                  ? lightColorScheme ?? kLimeLight
                  : context.watch<ThemeProvider>().monetLight(),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(
          //     seedColor: const Color(0xfff1db4a),
          //     primary: const Color(0xfff1db4a),
          //     secondary: const Color(0xff5c544c),
          //     brightness: Brightness.dark),
          colorScheme:
              context.watch<ThemeProvider>().getTheme == CustomTheme.monet
                  ? darkColorScheme ?? kLimeDark
                  : context.watch<ThemeProvider>().monetDark(),
          useMaterial3: true,
        ),
        themeMode: context.read<ThemeProvider>().themeMode,
        // themeMode: ThemeMode.dark,
        routes: {
          FolderPage.routeName: (_) => const FolderPage(),
          NotePage.routeName: (_) => const NotePage(title: 'Notes'),
          EditNote.routeName: (_) => const EditNote(),
          SearchPage.routeName: (_) => const SearchPage(),
          AddNote.routeName: (_) => const AddNote(),
        },
      );
    });
  }
}


// void colorPrint(BuildContext context) {
//   // final lcolor = context.read<ThemeProvider>().lightColors;
//   // final dcolor = context.read<ThemeProvider>().darkColors;
//   final dcolor = ColorScheme.fromSeed(
//       seedColor: const Color(0xfff1db4a),
//       primary: const Color(0xfff1db4a),
//       secondary: const Color(0xff5c544c),
//       brightness: Brightness.dark);
//   print("Light ColorScheme:");
//   // print(
//   //     "ColorScheme(brightness:${lcolor.brightness},primary:${lcolor.primary},onPrimary: ${lcolor.onPrimary},primaryContainer:${lcolor.primaryContainer},onPrimaryContainer:${lcolor.onPrimaryContainer},secondary:${lcolor.secondary},onSecondary:${lcolor.onSecondary},secondaryContainer:${lcolor.onSecondaryContainer},onSecondaryContainer:${lcolor.secondaryContainer},tertiary:${lcolor.tertiary},onTertiary:${lcolor.onTertiary},tertiaryContainer:${lcolor.tertiaryContainer},onTertiaryContainer:${lcolor.onTertiaryContainer},error:${lcolor.error},onError:${lcolor.onError},errorContainer:${lcolor.errorContainer},onErrorContainer:${lcolor.onErrorContainer},background:${lcolor.background},onBackground:${lcolor.onBackground},surface:${lcolor.surface},onSurface:${lcolor.onSurface},surfaceVariant:${lcolor.surfaceVariant},onSurfaceVariant:${lcolor.onSurfaceVariant},outline:${lcolor.outline},shadow:${lcolor.shadow},inverseSurface:${lcolor.inverseSurface},onInverseSurface:${lcolor.onInverseSurface},inversePrimary:${lcolor.inversePrimary},surfaceTint:${lcolor.surfaceTint},);");
//   print("Dark ColorScheme");
//   print(
//       "ColorScheme(brightness:${dcolor.brightness},primary:${dcolor.primary},onPrimary: ${dcolor.onPrimary},primaryContainer:${dcolor.primaryContainer},onPrimaryContainer:${dcolor.onPrimaryContainer},secondary:${dcolor.secondary},onSecondary:${dcolor.onSecondary},secondaryContainer:${dcolor.onSecondaryContainer},onSecondaryContainer:${dcolor.secondaryContainer},tertiary:${dcolor.tertiary},onTertiary:${dcolor.onTertiary},tertiaryContainer:${dcolor.tertiaryContainer},onTertiaryContainer:${dcolor.onTertiaryContainer},error:${dcolor.error},onError:${dcolor.onError},errorContainer:${dcolor.errorContainer},onErrorContainer:${dcolor.onErrorContainer},background:${dcolor.background},onBackground:${dcolor.onBackground},surface:${dcolor.surface},onSurface:${dcolor.onSurface},surfaceVariant:${dcolor.surfaceVariant},onSurfaceVariant:${dcolor.onSurfaceVariant},outline:${dcolor.outline},shadow:${dcolor.shadow},inverseSurface:${dcolor.inverseSurface},onInverseSurface:${dcolor.onInverseSurface},inversePrimary:${dcolor.inversePrimary},surfaceTint:${dcolor.surfaceTint},);");
// }
