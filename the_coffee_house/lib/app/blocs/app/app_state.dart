import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';

class AppState extends BaseBlocState {
  final ThemeType? appTheme;
  AppState({
    AppState? state,
    ThemeType? appTheme,
    bool? isLoading,
  })  : appTheme = appTheme ?? state?.appTheme,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
