import 'package:the_coffee_house/app/base/base_bloc_events.dart';

import 'home_state.dart';

class UpdateHomeTabEvent extends BaseBlocEvent {
  final HomeTab activeTab;

  UpdateHomeTabEvent(this.activeTab);
}
