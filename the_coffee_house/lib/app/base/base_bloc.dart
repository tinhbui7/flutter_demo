import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_bloc.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_events.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_state.dart';
import 'package:the_coffee_house/core/helpers/logger/logger_i.dart';
import 'package:the_coffee_house/domain/usecases/local_storage/local_storage_service_i.dart';

abstract class BaseBloc<S extends BaseBlocState>
    extends Bloc<BaseBlocEvent, S> {
  String get tag;

  BaseBloc(S initialState) : super(initialState) {
    on<FetchDataEvent>(fetchDataState);
    on<RefreshEvent>(refreshState);
  }

  bool get isContentEmpty => false;

  GetIt get getIt => GetIt.instance;
  ILogger? get _logger => getIt.get<ILogger>();
  NotifyAppBloc get notifyAppBloc => getIt.get<NotifyAppBloc>();
  ILocalStorageService get localStorageService =>
      getIt.get<ILocalStorageService>();

  Stream<S> fetchDataState(
    FetchDataEvent event,
    Emitter<S> emit,
  ) async* {}

  Stream<S> refreshState(
    RefreshEvent event,
    Emitter<S> emit,
  ) async* {}

  log(
    String tag,
    dynamic data,
  ) {
    _logger?.log(
      tag,
      data,
    );
  }

  logError(
    String tag,
    dynamic data,
  ) {
    _logger?.logError(
      tag,
      data,
    );
  }

  @protected
  handleException(ex) {
    notifyAppBloc.add(
      NotifyAppEvent(
        AppNotifyType.ERROR,
        'Network timeout',
      ),
    );
  }
}
