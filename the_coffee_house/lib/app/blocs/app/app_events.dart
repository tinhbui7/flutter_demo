import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';

class ChangeAppThemeEvent extends BaseBlocEvent {
  final ThemeType type;

  ChangeAppThemeEvent(this.type);
}

class ChangeLoginStatusEvent extends BaseBlocEvent {
  final bool isLogin;

  ChangeLoginStatusEvent(this.isLogin);
}
