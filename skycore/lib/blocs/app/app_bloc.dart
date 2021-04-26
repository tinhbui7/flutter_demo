import 'package:skycore/base/base_bloc.dart';
import 'package:skycore/base/base_bloc_events.dart';
import 'package:skycore/styles/app_theme.dart';

import 'app_events.dart';
import 'app_state.dart';

class AppBloc extends BaseBloc<AppState> {
  @override
  String get tag => 'AppBloc';

  AppBloc()
      : super(AppState(
          isLoading: false,
          appTheme: AppTheme.fromType(ThemeType.Orange_light),
        ));

  @override
  Stream<AppState> mapEventToState(BaseBlocEvent event) async* {
    if (event is ChangeAppThemeEvent) {
      yield* _changeAppThemeState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<AppState> _changeAppThemeState(ChangeAppThemeEvent event) async* {
    yield AppState(
      state: state,
      appTheme: AppTheme.fromType(event.type),
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
}
