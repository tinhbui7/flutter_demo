import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';

import 'other_tab_state.dart';

class OtherTabBloc extends BaseBloc<OtherTabState> {
  @override
  String get tag => 'OtherTabBloc';

  OtherTabBloc() : super(OtherTabState(isLoading: true));

  @override
  Stream<OtherTabState> mapEventToState(BaseBlocEvent event) async* {
    yield* super.mapEventToState(event);
  }

  @protected
  @override
  Stream<OtherTabState> fetchDataState(FetchDataEvent event) async* {
    yield OtherTabState(
      state: state,
      isLoading: false,
    );
  }

  @override
  Stream<OtherTabState> refreshState(RefreshEvent event) async* {
    yield OtherTabState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }
}
