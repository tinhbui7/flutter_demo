import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/domain/entities/order_entity.dart';
import 'package:the_coffee_house/domain/entities/store_entity.dart';

class AddNewBillEvent extends BaseBlocEvent {
  final OrderEntity? orderEntity;

  AddNewBillEvent(this.orderEntity);
}

class DeleteAllBillEvent extends BaseBlocEvent {}

class UpdateOrderItemEvent extends BaseBlocEvent {
  final OrderEntity? orderEntity;

  UpdateOrderItemEvent(this.orderEntity);
}

class DeleteOrderItemEvent extends BaseBlocEvent {
  final OrderEntity? orderEntity;

  DeleteOrderItemEvent(this.orderEntity);
}

class AddAddressEvent extends BaseBlocEvent {
  final String? address;
  final String? nameStreet;

  AddAddressEvent(this.address, this.nameStreet);
}

class AddStoreAddressEvent extends BaseBlocEvent {
  final StoreEntity? storeEntity;

  AddStoreAddressEvent(this.storeEntity);
}

class ChangeOrderMethodEvent extends BaseBlocEvent {
  final OrderTab? activeOrder;

  ChangeOrderMethodEvent(this.activeOrder);
}

class ChangeSaveAddressEvent extends BaseBlocEvent {
  final bool? value;

  ChangeSaveAddressEvent(this.value);
}
