import 'package:skycore/base/base_bloc_events.dart';

class CheckedEvent extends BaseBlocEvent {
  final bool checked;

  CheckedEvent(this.checked);
}
