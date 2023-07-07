import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';

class ChangeAppThemeEvent extends BaseBlocEvent {
  const ChangeAppThemeEvent(
    this.type,
  );

  final ThemeType type;

  @override
  List<Object> get props {
    return [
      type,
    ];
  }
}

class ChangeLoginStatusEvent extends BaseBlocEvent {
  final bool isLogin;

  const ChangeLoginStatusEvent(
    this.isLogin,
  );

  @override
  List<Object> get props {
    return [
      isLogin,
    ];
  }
}
