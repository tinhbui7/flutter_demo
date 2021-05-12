import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_events.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_state.dart';

class NotifyAppBloc extends BaseBloc<NotifyAppState> {
  @override
  String get tag => 'NotifyAppBloc';

  NotifyAppBloc() : super(NotifyAppState(isLoading: false));

  @override
  Stream<NotifyAppState> mapEventToState(BaseBlocEvent event) async* {
    if (event is NotifyAppEvent) {
      yield* _notifyAppState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<NotifyAppState> _notifyAppState(NotifyAppEvent event) async* {
    yield NotifyAppState(
      state: state,
      type: event.type,
      message: event.message,
    );
  }

  @override
  Stream<NotifyAppState> fetchDataState(FetchDataEvent event) async* {}

  @override
  Stream<NotifyAppState> refreshState(RefreshEvent event) async* {}

  notify({required AppNotifyType type, required String message}) {
    add(NotifyAppEvent(type: type, message: message));
  }
}
