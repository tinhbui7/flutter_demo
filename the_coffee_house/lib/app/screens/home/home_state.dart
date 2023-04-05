import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class HomeScreenState extends BaseBlocState {
  final HomeTab? activeTab;

  HomeScreenState({
    HomeScreenState? state,
    bool? isLoading,
    HomeTab? activeTab,
  })  : activeTab = activeTab ?? state?.activeTab,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}

enum HomeTab {
  Home,
  Order,
  Store,
  Point,
  Other,
}
