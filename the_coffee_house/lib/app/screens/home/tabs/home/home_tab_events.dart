import 'package:the_coffee_house/app/base/base_bloc_events.dart';

class SaveMessageEvent extends BaseBlocEvent {
  const SaveMessageEvent(this.message);

  final String message;

  @override
  List<Object> get props {
    return [
      message,
    ];
  }
}
