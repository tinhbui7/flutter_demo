import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skycore/styles/colors.dart';

class SnackBarTheme {
  static ThemeData build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    theme.copyWith(
      accentColor: theme.accentColor,
      accentColorBrightness: theme.accentColorBrightness,
      colorScheme: theme.colorScheme.copyWith(
        background: theme.brightness == Brightness.light
            ? kColorGrayDark
            : theme.colorScheme.onBackground,
        onBackground: theme.brightness == Brightness.light
            ? theme.colorScheme.onBackground
            : theme.colorScheme.background,
      ),
      textTheme: theme.textTheme.apply(
        bodyColor: theme.brightness == Brightness.light
            ? theme.colorScheme.onBackground
            : theme.colorScheme.background,
      ),
    );
    return theme;
  }
}
