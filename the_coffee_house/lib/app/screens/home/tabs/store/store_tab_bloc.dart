import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_state.dart';

class StoreTabBloc extends BaseBloc<StoreTabState> {
  @override
  String get tag => 'StoreTabBloc';

  StoreTabBloc() : super(StoreTabState(isLoading: true));

  @override
  Stream<StoreTabState> mapEventToState(BaseBlocEvent event) async* {
    yield* super.mapEventToState(event);
  }

  @protected
  @override
  Stream<StoreTabState> fetchDataState(FetchDataEvent event) async* {
    yield StoreTabState(
      state: state,
      isLoading: false,
    );
  }

  @override
  Stream<StoreTabState> refreshState(RefreshEvent event) async* {
    yield StoreTabState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }
}
