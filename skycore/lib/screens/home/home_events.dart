import 'package:skycore/base/base_bloc_events.dart';

class SaveMessageEvent extends BaseBlocEvent {
  final String message;

  SaveMessageEvent(this.message);
}
