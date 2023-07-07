import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_events.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_state.dart';

class NotifyAppBloc extends BaseBloc<NotifyAppState> {
  @override
  String get tag => 'NotifyAppBloc';

  NotifyAppBloc() : super(NotifyAppState()) {
    on<NotifyAppEvent>(_notifyApp);
  }

  void _notifyApp(
    NotifyAppEvent event,
    Emitter<NotifyAppState> emit,
  ) {
    emit(
      NotifyAppState(
        type: event.type,
        message: event.message,
      ),
    );
  }
}
