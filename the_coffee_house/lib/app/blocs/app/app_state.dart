import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';

class AppState extends BaseBlocState {
   AppState({
    this.appTheme = ThemeType.Light,
    this.isLoading = false,
    this.isLogin = false,
  }) : super(
    isLoading: isLoading,
    timeStamp: DateTime.now().millisecondsSinceEpoch,
  );

  final ThemeType appTheme;
  final bool isLoading;
  final bool isLogin;

  @override
  List<Object> get props {
    return [
      appTheme,
      isLoading,
      isLogin,
    ];
  }

  AppState copyWith({
    ThemeType? appTheme,
    bool? isLoading,
    bool? isLogin,
  }) {
    return AppState(
      appTheme: appTheme ?? this.appTheme,
      isLogin: isLogin ?? this.isLogin,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
