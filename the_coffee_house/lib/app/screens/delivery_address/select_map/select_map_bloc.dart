import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';

import 'select_map_state.dart';

class SelectMapBloc extends BaseBloc<SelectMapState> {
  @override
  String get tag => 'SelectMapBloc';

  SelectMapBloc() : super(SelectMapState(isLoading: true));

  @override
  Stream<SelectMapState> mapEventToState(BaseBlocEvent event) async* {
    yield* super.mapEventToState(event);
  }

  @protected
  @override
  Stream<SelectMapState> fetchDataState(FetchDataEvent event) async* {
    yield SelectMapState(
      state: state,
      isLoading: false,
    );
  }

  @override
  Stream<SelectMapState> refreshState(RefreshEvent event) async* {
    yield SelectMapState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }
}
