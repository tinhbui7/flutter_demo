import 'package:the_coffee_house/app/base/base_bloc_events.dart';

class CheckPhoneNumberEvent extends BaseBlocEvent {
  const CheckPhoneNumberEvent(
    this.phoneNumber,
  );

  final String phoneNumber;

  @override
  List<Object> get props {
    return [
      phoneNumber,
    ];
  }
}
