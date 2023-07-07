import 'package:the_coffee_house/app/base/base_bloc_events.dart';

import 'home_state.dart';

class UpdateHomeTabEvent extends BaseBlocEvent {
  const UpdateHomeTabEvent(
    this.activeTab,
  );

  final HomeTab activeTab;

  @override
  List<Object> get props {
    return [
      activeTab,
    ];
  }
}
