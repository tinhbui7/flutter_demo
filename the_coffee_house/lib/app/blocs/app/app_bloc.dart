import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';

import 'app_events.dart';
import 'app_state.dart';

class AppBloc extends BaseBloc<AppState> {
  @override
  String get tag => 'AppBloc';

  AppBloc() : super(AppState()) {
    on<ChangeAppThemeEvent>(_changeAppTheme);
    on<ChangeLoginStatusEvent>(_changeLoginStatus);
  }

  void _changeAppTheme(
    ChangeAppThemeEvent event,
    Emitter<AppState> emit,
  ) {
    emit(
      AppState(
        appTheme: event.type,
      ),
    );
  }

  void _changeLoginStatus(
    ChangeLoginStatusEvent event,
    Emitter<AppState> emit,
  ) {
    emit(
      AppState(
        isLogin: event.isLogin,
      ),
    );
  }

  @override
  Stream<AppState> fetchDataState(
    FetchDataEvent event,
    Emitter<AppState> emit,
  ) async* {
    emit(
      AppState(
        isLoading: !(event.refresh == true),
      ),
    );
  }

  @override
  Stream<AppState> refreshState(
    RefreshEvent event,
    Emitter<AppState> emit,
  ) async* {
    emit(
      AppState(
        isLoading: !(event.refresh == true),
      ),
    );
  }
}
