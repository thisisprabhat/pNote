import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.read<ThemeProvider>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            height: 100,
            child: SizedBox(
              height: 80,
              child: ListView(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: const [
                      ColorSelector(
                        circleColor: Color.fromARGB(255, 229, 248, 13),
                        customTheme: CustomTheme.lime,
                      ),
                      ColorSelector(
                        circleColor: Colors.green,
                        customTheme: CustomTheme.green,
                      ),
                      ColorSelector(
                        circleColor: Colors.purple,
                        customTheme: CustomTheme.purple,
                      ),
                      ColorSelector(
                        circleColor: Colors.blue,
                        customTheme: CustomTheme.blue,
                      ),
                      ColorSelector(
                        circleColor: Colors.red,
                        customTheme: CustomTheme.red,
                      ),
                      ColorSelector(
                        circleColor: Colors.pink,
                        customTheme: CustomTheme.pink,
                      ),
                      ColorSelector(
                        circleColor: Color.fromARGB(255, 245, 221, 148),
                        customTheme: CustomTheme.creame,
                      ),
                      ColorSelector(
                        circleColor: Colors.yellow,
                        customTheme: CustomTheme.yellow,
                      ),
                      ColorSelector(
                        circleColor: Color.fromARGB(255, 29, 204, 248),
                        customTheme: CustomTheme.skyBlue,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          themeModeBox(
              context: context,
              boxThemeMode: ThemeMode.system,
              title: 'System',
              icon: Icons.phone_android,
              topLeft: 30,
              topRight: 30),
          themeModeBox(
              context: context,
              boxThemeMode: data.themeMode,
              isModetColorBox: true,
              title: 'System Material Colors',
              icon: Icons.dynamic_feed),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              themeModeBox(
                  context: context,
                  boxThemeMode: ThemeMode.light,
                  title: 'Light Mode',
                  icon: Icons.sunny,
                  bottomLeft: 30),
              themeModeBox(
                  context: context,
                  boxThemeMode: ThemeMode.dark,
                  title: 'Dark Mode',
                  icon: Icons.dark_mode,
                  bottomRight: 30)
            ],
          ),
        ],
      ),
    );
  }
}

class ColorSelector extends StatelessWidget {
  const ColorSelector(
      {Key? key, required this.circleColor, required this.customTheme})
      : super(key: key);

  final Color circleColor;
  final CustomTheme customTheme;

  @override
  Widget build(BuildContext context) {
    // var boxInactiveColor = Theme.of(context).colorScheme.surfaceVariant;
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.read<ThemeProvider>().setTheme = customTheme;
            print(circleColor);
            print(customTheme);
            print(
                "this is provider theme: ${context.read<ThemeProvider>().getTheme}");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            height: 80,
            width: 60,
            decoration: BoxDecoration(
              // color: null,
              color: context.read<ThemeProvider>().getTheme == customTheme
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surface.withAlpha(65),
              // border: Border.all(color: Theme.of(context).colorScheme.outline),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: circleColor,
                  border: Border.all(
                      color:
                          context.read<ThemeProvider>().getTheme == customTheme
                              ? Colors.transparent
                              : Theme.of(context).colorScheme.surfaceVariant),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}

Widget themeModeBox({
  required BuildContext context,
  String title = '',
  required ThemeMode boxThemeMode,
  IconData icon = Icons.settings,
  bool isModetColorBox = false,
  double topLeft = 5,
  double topRight = 5,
  double bottomLeft = 5,
  double bottomRight = 5,
}) {
  final providedBoxThemeStatus =
      isModetColorBox ? CustomTheme.monet : boxThemeMode;
  final boxThemeStatus = isModetColorBox
      ? context.watch<ThemeProvider>().getTheme
      : context.watch<ThemeProvider>().themeMode;

  print(
      boxThemeStatus); //#########################################################
  return Expanded(
      child: InkWell(
    onTap: () {
      isModetColorBox
          ? context.read<ThemeProvider>().setTheme = CustomTheme.monet
          : context.read<ThemeProvider>().setThemeMode = boxThemeMode;
      print(boxThemeMode);
      print("Theme is feed to ThemeProvider: $boxThemeStatus");
      print(boxThemeStatus == boxThemeMode);
    },
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    ),
    child: Container(
      height: 60,
      margin: const EdgeInsets.all(2.5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: boxThemeStatus == providedBoxThemeStatus
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: boxThemeStatus == providedBoxThemeStatus
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  color: boxThemeStatus == providedBoxThemeStatus
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      ),
    ),
  ));
}
