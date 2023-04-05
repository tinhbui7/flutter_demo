import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/home/home_events.dart';
import 'package:the_coffee_house/app/screens/home/home_state.dart';

class HomeScreenBloc extends BaseBloc<HomeScreenState> {
  @override
  String get tag => 'HomeScreenBloc';
  HomeScreenBloc()
      : super(HomeScreenState(
          isLoading: false,
          activeTab: HomeTab.Home,
        ));

  @override
  Stream<HomeScreenState> mapEventToState(BaseBlocEvent event) async* {
    if (event is UpdateHomeTabEvent) {
      yield* _updateTabState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<HomeScreenState> _updateTabState(UpdateHomeTabEvent event) async* {
    yield HomeScreenState(
      state: state,
      activeTab: event.activeTab,
    );
  }

  void onItemTab({int? index}) {
    switch (index) {
      case 1:
        updateTab(HomeTab.Order);
        break;
      case 2:
        updateTab(HomeTab.Store);
        break;
      case 3:
        updateTab(HomeTab.Point);
        break;
      case 4:
        updateTab(HomeTab.Other);
        break;
      default:
        updateTab(HomeTab.Home);
        break;
    }
  }

  updateTab(HomeTab activeTab) {
    add(UpdateHomeTabEvent(activeTab));
  }
}
