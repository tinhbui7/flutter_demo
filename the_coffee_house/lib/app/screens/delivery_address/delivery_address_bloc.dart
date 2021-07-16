import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';

import 'delivery_address_state.dart';

class DeliveryAddressBloc extends BaseBloc<DeliveryAddressState> {
  @override
  String get tag => 'DeliveryAddressBloc';

  DeliveryAddressBloc() : super(DeliveryAddressState(isLoading: true));

  @override
  Stream<DeliveryAddressState> mapEventToState(BaseBlocEvent event) async* {
    yield* super.mapEventToState(event);
  }

  @protected
  @override
  Stream<DeliveryAddressState> fetchDataState(FetchDataEvent event) async* {
    yield DeliveryAddressState(
      state: state,
      isLoading: false,
    );
  }

  @override
  Stream<DeliveryAddressState> refreshState(RefreshEvent event) async* {
    yield DeliveryAddressState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }
}
