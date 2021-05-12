import 'package:core/exceptions/exceptions.dart';
import 'package:domain/usecases/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:skycore/base/base_bloc.dart';
import 'package:skycore/base/base_bloc_events.dart';
import 'package:skycore/screens/home/home_state.dart';

import 'home_events.dart';

class HomeScreenBloc extends BaseBloc<HomeScreenState> {
  @override
  String get tag => 'HomeScreenBloc';

  final _messageKey = 'message';
  IDemoService? get demoService => getIt.get<IDemoService>();

  HomeScreenBloc() : super(HomeScreenState(isLoading: true));

  @override
  Stream<HomeScreenState> mapEventToState(BaseBlocEvent event) async* {
    if (event is SaveMessageEvent) {
      yield* _saveMessageState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<HomeScreenState> _saveMessageState(SaveMessageEvent event) async* {
    await Future.delayed(const Duration(milliseconds: 200));
    // handleException(NetworkTimeoutException('url'));
    try {
      await localStorageService.set(_messageKey, event.message);
    } catch (ex) {
      handleException(ex);
      logError(tag, 'saveMessageState: ${ex.toString()}');
    }
    yield* fetchData(refresh: true);
  }

  @protected
  @override
  Stream<HomeScreenState> fetchDataState(FetchDataEvent event) async* {
    var message;
    try {
      message = await localStorageService.get(_messageKey);
      // message = await demoService?.dumpJson();
    } catch (ex) {
      handleException(ex);
      logError(tag, 'fetchDataState getMessage ${ex.toString()}');
    }
    yield HomeScreenState(
      state: state,
      message: message?.toString(),
      isLoading: false,
    );
  }

  @override
  Stream<HomeScreenState> refreshState(RefreshEvent event) async* {
    yield HomeScreenState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }

  saveMessage(String message) {
    add(SaveMessageEvent(message));
  }
}
