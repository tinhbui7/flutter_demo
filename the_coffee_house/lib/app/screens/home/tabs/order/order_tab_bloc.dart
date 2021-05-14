import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';

import 'order_tab_state.dart';

class OrderTabBloc extends BaseBloc<OrderTabState> {
  @override
  String get tag => 'OrderTabBloc';

  OrderTabBloc() : super(OrderTabState(isLoading: true));

  @override
  Stream<OrderTabState> mapEventToState(BaseBlocEvent event) async* {
    yield* super.mapEventToState(event);
  }

  @protected
  @override
  Stream<OrderTabState> fetchDataState(FetchDataEvent event) async* {
    yield OrderTabState(
      state: state,
      isLoading: false,
    );
  }

  @override
  Stream<OrderTabState> refreshState(RefreshEvent event) async* {
    yield OrderTabState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }
}
