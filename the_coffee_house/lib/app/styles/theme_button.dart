import 'package:flutter/material.dart';

class ThemeButton {
  static ThemeData buildPrimaryThemeButton(BuildContext context,
      {ThemeData? theme}) {
    ThemeData _theme = theme ?? Theme.of(context);
    return _theme.copyWith(
      textTheme: _theme.textTheme.copyWith(
        button: _theme.textTheme.button?.copyWith(
          color: _theme.colorScheme.onSecondary,
        ),
      ),
      iconTheme:
          _theme.iconTheme.copyWith(color: _theme.colorScheme.onSecondary),
      backgroundColor: _theme.colorScheme.primary,
    );
  }

  static ThemeData buildPrimaryDisableThemeButton(BuildContext context,
      {ThemeData? theme}) {
    ThemeData _theme = theme ?? Theme.of(context);
    return _theme.copyWith(
      textTheme: _theme.textTheme.copyWith(
        button: _theme.textTheme.button?.copyWith(
          color: _theme.colorScheme.onSecondary,
        ),
      ),
      iconTheme:
          _theme.iconTheme.copyWith(color: _theme.colorScheme.onSecondary),
      backgroundColor: _theme.disabledColor,
    );
  }

  static ThemeData buildBlueThemeButton(BuildContext context,
      {ThemeData? theme}) {
    ThemeData _theme = theme ?? Theme.of(context);
    return _theme.copyWith(
      textTheme: _theme.textTheme.copyWith(
        button: _theme.textTheme.button?.copyWith(
          color: _theme.colorScheme.onSecondary,
        ),
      ),
      iconTheme:
          _theme.iconTheme.copyWith(color: _theme.colorScheme.onSecondary),
      backgroundColor: _theme.accentColor,
    );
  }

  static ThemeData buildWhiteThemeButton(BuildContext context,
      {ThemeData? theme}) {
    ThemeData _theme = theme ?? Theme.of(context);
    return _theme.copyWith(
      textTheme: _theme.textTheme.copyWith(
        button: _theme.textTheme.button?.copyWith(
          color: _theme.colorScheme.onSurface,
        ),
      ),
      iconTheme: _theme.iconTheme.copyWith(
        color: _theme.accentColor,
      ),
      backgroundColor: _theme.colorScheme.background,
    );
  }
}
