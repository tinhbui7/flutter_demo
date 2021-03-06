import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';

import 'app_events.dart';
import 'app_state.dart';

class AppBloc extends BaseBloc<AppState> {
  @override
  String get tag => 'AppBloc';

  AppBloc()
      : super(AppState(
          isLoading: false,
          appTheme: ThemeType.Light,
          isLogin: false,
        ));

  @override
  Stream<AppState> mapEventToState(BaseBlocEvent event) async* {
    if (event is ChangeAppThemeEvent) {
      yield* _changeAppThemeState(event);
    } else if (event is ChangeLoginStatusEvent) {
      yield* _changeLoginStatusState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<AppState> _changeAppThemeState(ChangeAppThemeEvent event) async* {
    yield AppState(
      state: state,
      appTheme: event.type,
    );
  }

  Stream<AppState> _changeLoginStatusState(
      ChangeLoginStatusEvent event) async* {
    yield AppState(
      state: state,
      isLogin: event.isLogin,
    );
  }

  @override
  Stream<AppState> fetchDataState(FetchDataEvent event) async* {
    yield AppState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }

  @override
  Stream<AppState> refreshState(RefreshEvent event) async* {
    yield AppState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }

  changeAppTheme(ThemeType type) {
    add(ChangeAppThemeEvent(type));
  }

  changeLoginStatus(bool isLogin) {
    add(ChangeLoginStatusEvent(isLogin));
  }
}
