import 'package:flutter/material.dart';

import '../Themes/monet_colors.dart';

enum CustomTheme {
  monet,
  purple,
  blue,
  skyBlue,
  red,
  pink,
  yellow,
  creame,
  green,
  lime,
}

class ThemeProvider extends ChangeNotifier {
// For Monet Theming
  CustomTheme _theme = CustomTheme.monet;
  CustomTheme get getTheme => _theme;
  set setTheme(value) {
    _theme = value;
    notifyListeners();
  }

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  set setThemeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  monetLight() {
    switch (_theme) {
      case CustomTheme.purple:
        return kPurpleLight;
      case CustomTheme.blue:
        return kBlueLight;
      case CustomTheme.skyBlue:
        return kSkyBlueLight;
      case CustomTheme.green:
        return kGreenLight;
      case CustomTheme.lime:
        return kLimeLight;
      case CustomTheme.red:
        return kRedLight;
      case CustomTheme.pink:
        return kYinkLight;
      case CustomTheme.yellow:
        return kYellowLight;
      case CustomTheme.creame:
        return kCreameLight;
      default:
        return kLimeLight;
    }
  }

  monetDark() {
    switch (_theme) {
      case CustomTheme.purple:
        return kPurpleDark;
      case CustomTheme.blue:
        return kBlueDark;
      case CustomTheme.skyBlue:
        return kSkyBlueDark;
      case CustomTheme.green:
        return kGreenDark;
      case CustomTheme.lime:
        return kLimeDark;
      case CustomTheme.red:
        return kRedDark;
      case CustomTheme.pink:
        return kPinkDark;
      case CustomTheme.yellow:
        return kYellowDark;
      case CustomTheme.creame:
        return kCreameDark;
      default:
        return kLimeDark;
    }
  }
}
