import 'package:skycore/base/base_bloc_events.dart';
import 'package:skycore/styles/app_theme.dart';

class ChangeAppThemeEvent extends BaseBlocEvent {
  final ThemeType type;

  ChangeAppThemeEvent(this.type);
}
