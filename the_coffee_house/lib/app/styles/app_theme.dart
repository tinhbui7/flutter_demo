import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/styles/themes/app/dark_theme.dart';
import 'package:the_coffee_house/app/styles/themes/app/light_theme.dart';

enum ThemeType {
  Dark,
  Light,
}

class AppTheme {
  static ThemeData build(BuildContext context, {ThemeType? theme}) {
    switch (theme) {
      case ThemeType.Light:
        return LightTheme().build(context);
      default:
        return DarkTheme().build(context);
    }
  }
}
