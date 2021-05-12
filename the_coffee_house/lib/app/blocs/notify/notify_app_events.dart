import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_state.dart';

class NotifyAppEvent extends BaseBlocEvent {
  final AppNotifyType type;
  final String message;

  NotifyAppEvent({required this.type, required this.message});
}
