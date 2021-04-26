import 'package:skycore/base/base_bloc_events.dart';

import 'notify_app_state.dart';

class NotifyAppEvent extends BaseBlocEvent {
  final AppNotifyType type;
  final String message;

  NotifyAppEvent({required this.type, required this.message});
}
