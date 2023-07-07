import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/screens/home/home_events.dart';
import 'package:the_coffee_house/app/screens/home/home_state.dart';

class HomeScreenBloc extends BaseBloc<HomeScreenState> {
  @override
  String get tag => 'HomeScreenBloc';
  HomeScreenBloc() : super(HomeScreenState()) {
    on<UpdateHomeTabEvent>(_updateTab);
  }

  void _updateTab(
    UpdateHomeTabEvent event,
    Emitter<HomeScreenState> emit,
  ) {
    emit(
      HomeScreenState(
        activeTab: event.activeTab,
      ),
    );
  }

  void onItemTab({
     int? index,
  }) {
    switch (index) {
      case 1:
        add(
          UpdateHomeTabEvent(
            HomeTab.Order,
          ),
        );
        break;
      case 2:
        add(
          UpdateHomeTabEvent(
            HomeTab.Store,
          ),
        );
        break;
      case 3:
        add(
          UpdateHomeTabEvent(
            HomeTab.Point,
          ),
        );
        break;
      case 4:
        add(
          UpdateHomeTabEvent(
            HomeTab.Other,
          ),
        );
        break;
      default:
        add(
          UpdateHomeTabEvent(
            HomeTab.Home,
          ),
        );
        break;
    }
  }
}
