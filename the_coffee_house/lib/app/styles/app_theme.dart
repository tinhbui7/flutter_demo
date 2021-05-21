import 'package:flutter/material.dart';

enum ThemeType {
  Default,
  Orange_light,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.Orange_light;
  late ThemeType type;
  bool isDark;
  late Color bg1;
  late Color surface1;
  late Color accent1;
  late Color greyWeak;
  late Color grey;
  late Color greyMedium;
  late Color greyStrong;
  late Color focus;
  late Color secondaryColor;
  late Color bg2;
  late Color accent2;

  /// Darkness adjusted text color. Will be Black in light mode, and White in dark
  late Color mainTextColor;
  late Color inverseTextColor;

  AppTheme({required this.isDark}) {
    mainTextColor = (isDark ? Colors.white : Colors.black);
    inverseTextColor = (isDark ? Colors.black : Colors.white);
  }

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.Orange_light:
        return AppTheme(isDark: false)
          ..type = t
          ..bg1 = const Color(0xfff3f3f3)
          ..surface1 = Colors.white
          ..accent1 = const Color(0xffc6581c)
          ..greyWeak = const Color(0xffcccccc)
          ..grey = const Color(0xff999999)
          ..greyMedium = const Color(0xff747474)
          ..greyStrong = const Color(0xff333333)
          ..focus = const Color(0xffd81e1e)
          ..secondaryColor = const Color(0xff1976d2)
          ..bg2 = const Color(0xffffffff)
          ..accent2 = const Color(0xffc5671b);

      case ThemeType.Default:
        return AppTheme(isDark: true)
          ..type = t
          ..bg1 = Colors.black
          ..surface1 = Colors.black
          ..accent1 = const Color(0xffff392b)
          ..greyWeak = const Color(0xffcccccc)
          ..grey = const Color(0xff999999)
          ..greyMedium = const Color(0xff747474)
          ..greyStrong = const Color(0xff333333)
          ..focus = const Color(0xffd81e1e)
          ..secondaryColor = const Color(0xff1976d2)
          ..bg2 = Colors.black
          ..accent2 = const Color(0xffc5671b);
      default:
        break;
    }
    return AppTheme.fromType(defaultTheme);
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      // Use the .dark() and .light() constructors to handle the text themes
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      // Use ColorScheme to generate the bulk of the color theme
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: accent2,
        primaryVariant: shift(accent1, .1),
        secondary: secondaryColor,
        secondaryVariant: shift(secondaryColor, .1),
        background: bg2,
        surface: surface1,
        onBackground: mainTextColor,
        onSurface: mainTextColor,
        onError: mainTextColor,
        onPrimary: inverseTextColor,
        onSecondary: Colors.white,
        error: focus,
      ),
    );

    // Apply additional styling that is missed by ColorScheme
    t.copyWith(
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: surface1,
        selectionHandleColor: Colors.transparent,
        selectionColor: surface1,
      ),
      buttonColor: accent1,
      highlightColor: shift(accent1, .1),
      toggleableActiveColor: accent1,
    );
    // All done, return the ThemeData

    return t;
  }

  /// This will add luminance in dark mode, and remove it in light.
  // Allows the view to just make something "stronger" or "weaker" without worrying what the current theme brightness is
  //      color = theme.shift(someColor, .1); //-10% lum in dark mode, +10% in light mode
  Color shift(Color c, double amt) {
    amt *= (isDark ? -1 : 1);
    var hslc = HSLColor.fromColor(c); // Convert to HSL
    double lightness =
        (hslc.lightness + amt).clamp(0, 1.0) as double; // Add/Remove lightness
    return hslc.withLightness(lightness).toColor(); // Convert back to Color
  }
}
