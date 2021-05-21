import 'package:the_coffee_house/app/base/base_bloc_events.dart';

class CheckPhoneNumberEvent extends BaseBlocEvent {
  final String phoneNumber;
  CheckPhoneNumberEvent(this.phoneNumber);
}
