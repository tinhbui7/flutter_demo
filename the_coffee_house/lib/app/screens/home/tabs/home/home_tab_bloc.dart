import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';

import 'home_tab_events.dart';
import 'home_tab_state.dart';

class HomeTabBloc extends BaseBloc<HomeTabState> {
  @override
  String get tag => 'HomeTabBloc';

  final _messageKey = 'message';

  HomeTabBloc() : super(HomeTabState()) {
    on<SaveMessageEvent>(_saveMessage);
  }

  Stream<HomeTabState> _saveMessage(
    SaveMessageEvent event,
    Emitter<HomeTabState> emit,
  ) async* {
    try {
      await localStorageService.set(_messageKey, event.message);
    } catch (ex) {
      handleException(ex);
      logError(tag, 'saveMessageState: ${ex.toString()}');
    }
    // fetchData(refresh: true);
  }

  @protected
  @override
  Stream<HomeTabState> fetchDataState(
    FetchDataEvent event,
    Emitter<HomeTabState> emit,
  ) async* {
    String message = '';
    try {
      message = await localStorageService.get(_messageKey);
    } catch (ex) {
      handleException(ex);
      logError(tag, 'fetchDataState getMessage: ${ex.toString()}');
    }
    emit(
      HomeTabState(
        message: message,
      ),
    );
  }

  @override
  Stream<HomeTabState> refreshState(
    RefreshEvent event,
    Emitter<HomeTabState> emit,
  ) async* {
    emit(
      HomeTabState(
        // isLoading: !(event.refresh == true),
      ),
    );
  }
}
