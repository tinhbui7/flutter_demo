import 'package:the_coffee_house/app/base/base_bloc.dart';

import 'delivery_address_state.dart';

class DeliveryAddressBloc extends BaseBloc<DeliveryAddressState> {
  @override
  String get tag => 'DeliveryAddressBloc';

  DeliveryAddressBloc() : super(DeliveryAddressState());
}
