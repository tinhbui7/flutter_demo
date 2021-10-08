import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'theme_by_viewport.dart';

/// App's default theme
///
/// https://material.io/design/typography/the-type-system.html#applying-the-type-scale
/// https://api.flutter.dev/flutter/material/TextTheme-class.html
/// https://mediag.com/blog/popular-screen-resolutions-designing-for-all/
///
abstract class BaseAppTheme extends ThemeByViewPort {
  Color get primaryColor => kColorBlue;
  Color get primaryColorBare => kColorBlueLightest;
  Color get accentColor => kColorOrange;
  Color get disabledColor => kColorGrayLight;
  Color get hintColor => kColorGray;
  Color get cardBorderColor => kColorGrayLight;
  Color get placeholderColor => kColorGrayLight1;
  Color get placeholderHighlightColor => kColorGrayLight2;
  Color get cardBackground => kColorGrayLight3;

  /// Status Colors
  Color get onGoingStatusColor => kColorTealLight;
  Color get liveStatusColor => kColorRed;
  Color get onlineStatusColor => onGoingStatusColor;
  Color get awayStatusColor => kColorGray;

  /// event date color
  Color get onGoingEventDateColor => kColorGreenDark;
  Color get pastEventDateColor => kColorRed;
  Color get defaultEventDateColor => primaryColor;

  /// Subscription colors
  Color get premiumSubscriptionColor => kColorGoldLight;
  Color get heroBadgeColor => kColorYellow;
  Color get allStarBadgeColor => kColorYellowDark;

  Color get textColor => kColorBlackLight;

  Brightness get brightness => Brightness.light;
  Color? get backgroundColor => kColorWhite;
  Color? get onBackgroundColor => kColorBlack;
  Color? get buttonColor => kColorBlueDark;

  ThemeData build(BuildContext context) {
    return buildThemByViewPort(_buildBaseAppTheme(context), context);
  }

  ThemeData _buildBaseAppTheme(BuildContext context) {
    ThemeData theme = Theme.of(context).copyWith(
      textTheme: GoogleFonts.robotoTextTheme(
        Theme.of(context).textTheme.apply(
              bodyColor: kColorBlack,
              decorationColor: kColorGrayDark,
              displayColor: kColorBlack,
              fontFamily: 'roboto_regular',
            ),
      ),
    );

    return theme.copyWith(
      brightness: brightness,
      platform: defaultTargetPlatform == TargetPlatform.iOS
          ? TargetPlatform.iOS
          : TargetPlatform.android,
      accentColor: accentColor,
      accentColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      backgroundColor: backgroundColor,
      primaryColor: primaryColor,
      primaryColorDark: kColorPrimaryDark,
      primaryColorLight: kColorPrimaryLight,
      errorColor: kColorRed,
      toggleableActiveColor: kColorPrimary,
      disabledColor: disabledColor,
      unselectedWidgetColor: kColorGray,
      highlightColor: kColorGrayLight3,
      bottomAppBarColor: kColorWhite,
      hintColor: hintColor,
      splashColor: kColorGrayBareA1,
      cardColor: kColorWhite,
      canvasColor: kColorTransparent,
      dividerColor: kColorGrayLight,
      buttonColor: buttonColor,
      indicatorColor: kColorGrayLight,
      inputDecorationTheme: theme.inputDecorationTheme,
      iconTheme: theme.iconTheme.copyWith(color: kColorBlack, size: 23),
      accentIconTheme: theme.accentIconTheme.copyWith(
        color: kColorWhite,
        size: 23,
      ),
      primaryIconTheme: theme.primaryIconTheme.copyWith(
        color: kColorWhite,
        size: 23,
      ),
      accentTextTheme: theme.accentTextTheme.copyWith(
        button: theme.accentTextTheme.button?.copyWith(color: kColorWhite),
        headline6: theme.accentTextTheme.button?.copyWith(color: kColorWhite),
        bodyText2: theme.accentTextTheme.button?.copyWith(color: kColorWhite),
      ),
      textTheme: theme.textTheme.copyWith(
        // MD-headline1
        headline1: theme.textTheme.headline1?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 33.5,
        ),

        // MD-headline2
        headline2: theme.textTheme.headline2?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 33.5,
        ),

        // MD-headline3
        headline3: theme.textTheme.headline3?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w800,
          fontSize: 27.5,
        ),

        // MD-headline4
        headline4: theme.textTheme.headline4?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 24.5,
        ),

        // MD-headline5
        headline5: theme.textTheme.headline5?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 21.5,
        ),

        // MD-headline6
        headline6: theme.textTheme.headline6?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 24.5,
        ),

        // MD-subtitle1
        subtitle1: theme.textTheme.subtitle1?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),

        // MD-body1
        bodyText1: theme.textTheme.bodyText1?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 14.8,
        ),

        // MD-body2
        bodyText2: theme.textTheme.bodyText2?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 14.8,
        ),

        // MD-caption
        caption: theme.textTheme.caption?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 13.8,
        ),

        // MD-button
        button: theme.textTheme.button?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),

        // MD-subtitle2
        subtitle2: theme.textTheme.subtitle2?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 20.0,
        ),

        // MD-overline
        overline: theme.textTheme.overline?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 13.0,
          letterSpacing: 0.1,
        ),
      ),
      primaryTextTheme: theme.primaryTextTheme.copyWith(
        // MD-headline1
        headline1: theme.primaryTextTheme.headline1?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w700,
          fontSize: 33.5,
        ),

        // MD-headline2
        headline2: theme.primaryTextTheme.headline2?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w600,
          fontSize: 33.5,
        ),

        // MD-headline3
        headline3: theme.primaryTextTheme.headline3?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w800,
          fontSize: 27.5,
        ),

        // MD-headline4
        headline4: theme.primaryTextTheme.headline4?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w700,
          fontSize: 24.5,
        ),

        // MD-headline5
        headline5: theme.primaryTextTheme.headline5?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w500,
          fontSize: 21.5,
        ),

        // MD-headline6
        headline6: theme.primaryTextTheme.headline6?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w700,
          fontSize: 24.5,
        ),

        // MD-subtitle1
        subtitle1: theme.primaryTextTheme.subtitle1?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),

        // MD-body1
        bodyText1: theme.primaryTextTheme.bodyText1?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w700,
          fontSize: 14.8,
        ),

        // MD-body2
        bodyText2: theme.primaryTextTheme.bodyText2?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w500,
          fontSize: 14.8,
        ),

        // MD-caption
        caption: theme.primaryTextTheme.caption?.copyWith(
          color: kColorGray1,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),

        // MD-button
        button: theme.primaryTextTheme.button?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),

        // MD-subtitle2
        subtitle2: theme.primaryTextTheme.subtitle2?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w600,
          fontSize: 20.0,
        ),

        // MD-overline
        overline: theme.primaryTextTheme.overline?.copyWith(
          color: kColorWhite,
          fontWeight: FontWeight.w400,
          fontSize: 13.0,
          letterSpacing: 0.1,
          // height: 1.1
        ),
      ),
      chipTheme: buildChipTheme(theme),
      buttonTheme: buildButtonTheme(theme),
      colorScheme: buildColorScheme(theme),
    );
  }

  ButtonThemeData buildButtonTheme(ThemeData theme) {
    return ButtonThemeData(
      highlightColor: kColorTransparent,
      splashColor: kColorGrayBareA1,
      colorScheme: theme.buttonTheme.colorScheme?.copyWith(
        primary: theme.primaryColor,
        primaryVariant: theme.primaryColorDark,
        secondary: kColorSecondary1,
        secondaryVariant: kColorSecondary1Dark,
        surface: theme.primaryColor,
        onSurface: kColorWhite,
        brightness: brightness,
        onSecondary: kColorWhite,
        onPrimary: kColorWhite,
        onError: kColorWhite,
        onBackground: kColorBlackLight,
        error: theme.errorColor,
        background: kColorGrayLight,
      ),
    );
  }

  ChipThemeData? buildChipTheme(ThemeData theme) {
    return theme.chipTheme.copyWith(
      backgroundColor: kColorGrayLight2,
      disabledColor: kColorGrayLight1,
      selectedColor: kColorGrayDark,
      secondarySelectedColor: kColorOrangeDark,
      labelPadding: const EdgeInsets.symmetric(horizontal: 12.0),
      padding: const EdgeInsets.all(0.0),
      shape: StadiumBorder(),
      labelStyle: const TextStyle(color: kColorGrayDark, fontSize: 15.5),
      secondaryLabelStyle: TextStyle(
        color: kColorGrayDark,
      ),
      brightness: Brightness.dark,
    );
  }

  ColorScheme? buildColorScheme(ThemeData theme) {
    return theme.colorScheme.copyWith(
      onPrimary: kColorWhite,
      brightness: brightness,
      error: kColorError,
      background: backgroundColor,
      onBackground: onBackgroundColor,
      onError: kColorWhite,
      onSecondary: kColorLightGray,
      primary: primaryColor,
      primaryVariant: kColorGreenDark,
      secondary: kColorBlueLighter,
      secondaryVariant: kColorBlueLightest,
      surface: kColorWhite,
      onSurface: kColorGrayDark,
    );
  }
}
