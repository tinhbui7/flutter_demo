import 'package:flutter/material.dart';

import '../../base_theme.dart';
import '../../colors.dart';

class DarkTheme extends BaseAppTheme {
  @override
  Color get primaryColor => kColorOrangeDark1;

  @override
  Color get textColor => kColorWhite;

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color? get backgroundColor => kColorBlackLight;

  @override
  Color? get onBackgroundColor => kColorWhite;

  @override
  Color? get buttonColor => kColorWhite;
}
