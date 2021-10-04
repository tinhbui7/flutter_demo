import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:the_coffee_house/app/constants/viewports.dart';

abstract class ThemeByViewPort {
  ThemeData _scaleTheme(ThemeData base, double scale) {
    final ThemeData theme = base.copyWith(
      textTheme: base.textTheme.copyWith(
        headline1: base.textTheme.headline1?.copyWith(
          fontSize: (base.textTheme.headline1?.fontSize ?? 1) * scale,
        ),
        headline2: base.textTheme.headline2?.copyWith(
          fontSize: (base.textTheme.headline2?.fontSize ?? 1) * scale,
        ),
        headline3: base.textTheme.headline3?.copyWith(
          fontSize: (base.textTheme.headline3?.fontSize ?? 1) * scale,
        ),
        headline4: base.textTheme.headline4?.copyWith(
          fontSize: (base.textTheme.headline4?.fontSize ?? 1) * scale,
        ),
        headline5: base.textTheme.headline5?.copyWith(
          fontSize: (base.textTheme.headline5?.fontSize ?? 1) * scale,
        ),
        headline6: base.textTheme.headline6?.copyWith(
          fontSize: (base.textTheme.headline6?.fontSize ?? 1) * scale,
        ),
        subtitle1: base.textTheme.subtitle1?.copyWith(
          fontSize: (base.textTheme.subtitle1?.fontSize ?? 1) * scale,
        ),
        bodyText1: base.textTheme.bodyText1?.copyWith(
          fontSize: (base.textTheme.bodyText1?.fontSize ?? 1) * scale,
        ),
        bodyText2: base.textTheme.bodyText2?.copyWith(
          fontSize: (base.textTheme.bodyText2?.fontSize ?? 1) * scale,
        ),
        caption: base.textTheme.caption?.copyWith(
          fontSize: (base.textTheme.caption?.fontSize ?? 1) * scale,
        ),
        button: base.textTheme.button?.copyWith(
          fontSize: (base.textTheme.button?.fontSize ?? 1) * scale,
        ),
        subtitle2: base.textTheme.subtitle2?.copyWith(
          fontSize: (base.textTheme.subtitle2?.fontSize ?? 1) * scale,
        ),
        overline: base.textTheme.overline?.copyWith(
          fontSize: (base.textTheme.overline?.fontSize ?? 1) * scale,
        ),
      ),
      primaryTextTheme: base.primaryTextTheme.copyWith(
        headline1: base.primaryTextTheme.headline1?.copyWith(
          fontSize: (base.primaryTextTheme.headline1?.fontSize ?? 1) * scale,
        ),
        headline2: base.primaryTextTheme.headline2?.copyWith(
          fontSize: (base.primaryTextTheme.headline2?.fontSize ?? 1) * scale,
        ),
        headline3: base.primaryTextTheme.headline3?.copyWith(
          fontSize: (base.primaryTextTheme.headline3?.fontSize ?? 1) * scale,
        ),
        headline4: base.primaryTextTheme.headline4?.copyWith(
          fontSize: (base.primaryTextTheme.headline4?.fontSize ?? 1) * scale,
        ),
        headline5: base.primaryTextTheme.headline5?.copyWith(
          fontSize: (base.primaryTextTheme.headline5?.fontSize ?? 1) * scale,
        ),
        headline6: base.primaryTextTheme.headline6?.copyWith(
          fontSize: (base.primaryTextTheme.headline6?.fontSize ?? 1) * scale,
        ),
        subtitle1: base.primaryTextTheme.subtitle1?.copyWith(
          fontSize: (base.primaryTextTheme.subtitle1?.fontSize ?? 1) * scale,
        ),
        bodyText1: base.primaryTextTheme.bodyText1?.copyWith(
          fontSize: (base.primaryTextTheme.bodyText1?.fontSize ?? 1) * scale,
        ),
        bodyText2: base.primaryTextTheme.bodyText2?.copyWith(
          fontSize: (base.primaryTextTheme.bodyText2?.fontSize ?? 1) * scale,
        ),
        caption: base.primaryTextTheme.caption?.copyWith(
          fontSize: (base.primaryTextTheme.caption?.fontSize ?? 1) * scale,
        ),
        button: base.primaryTextTheme.button?.copyWith(
          fontSize: (base.primaryTextTheme.button?.fontSize ?? 1) * scale,
        ),
        subtitle2: base.primaryTextTheme.subtitle2?.copyWith(
          fontSize: (base.primaryTextTheme.subtitle2?.fontSize ?? 1) * scale,
        ),
        overline: base.primaryTextTheme.overline?.copyWith(
          fontSize: (base.primaryTextTheme.overline?.fontSize ?? 1) * scale,
        ),
      ),
      iconTheme: base.iconTheme.copyWith(
        size: 23 * scale,
      ),
      accentIconTheme: base.accentIconTheme.copyWith(
        size: 23 * scale,
      ),
      primaryIconTheme: base.primaryIconTheme.copyWith(
        size: 23 * scale,
      ),
    );

    return theme;
  }

  ThemeData extendTablet(BuildContext context, {ThemeData? themeData}) {
    return themeData ?? Theme.of(context);
  }

  ThemeData buildThemByViewPort(ThemeData? themeData, BuildContext context) {
    ThemeData extThemeData;
    final double viewPortSize =
        window.physicalSize.width / window.devicePixelRatio;
    final ThemeData base = themeData ?? Theme.of(context);

    // Initializing typography for each screen size
    if (viewPortSize <= ViewPorts.MAX_MOBILE_VIEWPORT_SIZE) {
      extThemeData = base;
    } else if (viewPortSize > ViewPorts.MAX_MOBILE_VIEWPORT_SIZE &&
        viewPortSize <= ViewPorts.MAX_VIEWPORT_SIZE) {
      extThemeData = _scaleTheme(
        base,
        math.min(
          viewPortSize / ViewPorts.BASE_VIEWPORT_SIZE,
          ViewPorts.MAX_SCALE,
        ),
      );
    } else {
      extThemeData = _scaleTheme(
        base,
        math.min(
          viewPortSize / ViewPorts.BASE_VIEWPORT_SIZE,
          ViewPorts.TABLET_MAX_SCALE,
        ),
      );
    }

    return extThemeData;
  }
}
