import 'package:the_coffee_house/app/base/base_bloc_state.dart';

enum AppNotifyType {
  INFO,
  ERROR,
}

class NotifyAppState extends BaseBlocState {
  const NotifyAppState({
    this.type,
    this.message,
  });

  final AppNotifyType? type;
  final String? message;

  @override
  List<Object?> get props {
    return [
      type,
      message,
    ];
  }

  NotifyAppState copyWith({
    AppNotifyType? type,
    String? message,
  }) {
    return NotifyAppState(
      type: type ?? this.type,
      message: message ?? this.message,
    );
  }
}
