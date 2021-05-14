import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/home/tabs/point/point_tab_state.dart';

class PointTabBloc extends BaseBloc<PointTabState> {
  @override
  String get tag => 'PointTabBloc';

  PointTabBloc() : super(PointTabState(isLoading: true));

  @override
  Stream<PointTabState> mapEventToState(BaseBlocEvent event) async* {
    yield* super.mapEventToState(event);
  }

  @protected
  @override
  Stream<PointTabState> fetchDataState(FetchDataEvent event) async* {
    yield PointTabState(
      state: state,
      isLoading: false,
    );
  }

  @override
  Stream<PointTabState> refreshState(RefreshEvent event) async* {
    yield PointTabState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }
}
