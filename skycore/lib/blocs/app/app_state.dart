import 'package:skycore/base/base_bloc_state.dart';
import 'package:skycore/styles/app_theme.dart';

class AppState extends BaseBlocState {
  final AppTheme? appTheme;
  AppState({
    AppState? state,
    AppTheme? appTheme,
    bool? isLoading,
  })  : appTheme = appTheme ?? state?.appTheme,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
