import 'package:flutter/material.dart';

import '../../base_theme.dart';
import '../../colors.dart';

class LightTheme extends BaseAppTheme {
  @override
  Color get primaryColor => kColorOrangeDark1;

  @override
  Color get textColor => kColorBlackLight;

  @override
  Brightness get brightness => Brightness.light;
}
