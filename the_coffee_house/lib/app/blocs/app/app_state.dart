import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';

class AppState extends BaseBlocState {
  final ThemeType? appTheme;
  final bool? isLogin;
  AppState(
      {AppState? state, ThemeType? appTheme, bool? isLoading, bool? isLogin})
      : appTheme = appTheme ?? state?.appTheme,
        isLogin = isLogin ?? state?.isLogin,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
