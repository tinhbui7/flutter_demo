import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';

import 'home_tab_events.dart';
import 'home_tab_state.dart';

class HomeTabBloc extends BaseBloc<HomeTabState> {
  @override
  String get tag => 'HomeTabBloc';

  final _messageKey = 'message';

  HomeTabBloc() : super(HomeTabState(isLoading: false));

  @override
  Stream<HomeTabState> mapEventToState(BaseBlocEvent event) async* {
    if (event is SaveMessageEvent) {
      yield* _saveMessageState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<HomeTabState> _saveMessageState(SaveMessageEvent event) async* {
    try {
      await localStorageService.set(_messageKey, event.message);
    } catch (ex) {
      handleException(ex);
      logError(tag, 'saveMessageState: ${ex.toString()}');
    }
    fetchData(refresh: true);
  }

  @protected
  @override
  Stream<HomeTabState> fetchDataState(FetchDataEvent event) async* {
    String? message;
    try {
      message = await localStorageService.get(_messageKey);
    } catch (ex) {
      handleException(ex);
      logError(tag, 'fetchDataState getMessage: ${ex.toString()}');
    }
    yield HomeTabState(
      state: state,
      message: message,
      isLoading: false,
    );
  }

  @override
  Stream<HomeTabState> refreshState(RefreshEvent event) async* {
    yield HomeTabState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }

  void saveMessage(String message) {
    add(SaveMessageEvent(message));
  }
}
