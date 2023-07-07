import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class HomeScreenState extends BaseBlocState {
  const HomeScreenState({
    this.activeTab = HomeTab.Home,
  });

  final HomeTab activeTab;

  @override
  List<Object> get props {
    return [
      activeTab,
    ];
  }

  HomeScreenState copyWith({
    HomeTab? activeTab,
  }) {
    return HomeScreenState(
      activeTab: activeTab ?? this.activeTab,
    );
  }
}

enum HomeTab {
  Home,
  Order,
  Store,
  Point,
  Other,
}
