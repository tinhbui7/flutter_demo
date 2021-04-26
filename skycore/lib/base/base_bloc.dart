import 'package:core/exceptions/exceptions.dart';
import 'package:core/helpers/logger/logger_i.dart';
import 'package:domain/usecases/local_storage/local_storage_service_i.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skycore/base/base_bloc_events.dart';
import 'package:skycore/base/base_bloc_state.dart';
import 'package:skycore/blocs/notify/notify_app_bloc.dart';
import 'package:skycore/blocs/notify/notify_app_state.dart';

abstract class BaseBloc<S extends BaseBlocState>
    extends Bloc<BaseBlocEvent, S> {
  String get tag;

  BaseBloc(S initialState) : super(initialState);

  bool get isContentEmpty => false;

  GetIt get getIt => GetIt.instance;
  ILogger? get _logger => getIt.get<ILogger>();
  NotifyAppBloc get notifyAppBloc => getIt.get<NotifyAppBloc>();
  ILocalStorageService get localStorageService =>
      getIt.get<ILocalStorageService>();

  @protected
  Stream<S> fetchDataState(FetchDataEvent event);

  @protected
  Stream<S> refreshState(RefreshEvent event);

  @override
  Stream<S> mapEventToState(BaseBlocEvent event) async* {
    if (event is FetchDataEvent) {
      yield* fetchDataState(event);
    } else if (event is RefreshEvent) {
      yield* refreshState(event);
    }
  }

  fetchData({bool? refresh}) {
    add(FetchDataEvent(refresh));
  }

  refreshData({bool? refresh}) {
    add(RefreshEvent(refresh));
  }

  log(String tag, dynamic data) {
    _logger?.log(tag, data);
  }

  logError(String tag, dynamic data) {
    _logger?.logError(tag, data);
  }

  @protected
  handleException(ex) {
    if (ex is NetworkTimeoutException) {
      notifyAppBloc.notify(
        type: AppNotifyType.ERROR,
        message: 'Network timeout',
      );
    } else if (ex is UnAuthenticatedException) {
      notifyAppBloc.notify(
        type: AppNotifyType.ERROR,
        message: 'Unauthenticated! Please login again!',
      );
    } else {
      return;
    }
  }
}
