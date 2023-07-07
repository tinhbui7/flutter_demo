import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/domain/entities/order_entity.dart';
import 'package:the_coffee_house/domain/entities/store_entity.dart';

class AddNewBillEvent extends BaseBlocEvent {
  const AddNewBillEvent(
    this.orderEntity,
  );

  final OrderEntity orderEntity;

  @override
  List<Object> get props {
    return [
      orderEntity,
    ];
  }
}

class DeleteAllBillEvent extends BaseBlocEvent {}

// @tinh-bui optimize code, there is a sign of the same code as AddNewBillEvent
class UpdateOrderItemEvent extends BaseBlocEvent {
  const UpdateOrderItemEvent(
    this.orderEntity,
  );

  final OrderEntity orderEntity;

  @override
  List<Object> get props {
    return [
      orderEntity,
    ];
  }
}

// @tinh-bui optimize code, there is a sign of the same code as AddNewBillEvent
class DeleteOrderItemEvent extends BaseBlocEvent {
  const DeleteOrderItemEvent(
    this.orderEntity,
  );

  final OrderEntity orderEntity;

  @override
  List<Object> get props {
    return [
      orderEntity,
    ];
  }
}

class AddAddressEvent extends BaseBlocEvent {
  const AddAddressEvent(
    this.address,
    this.nameStreet,
  );

  final String address;
  final String nameStreet;

  @override
  List<Object> get props {
    return [
      address,
      nameStreet,
    ];
  }
}

class AddStoreAddressEvent extends BaseBlocEvent {
  const AddStoreAddressEvent(
    this.storeEntity,
  );

  final StoreEntity storeEntity;

  @override
  List<Object> get props {
    return [
      storeEntity,
    ];
  }
}

class ChangeOrderMethodEvent extends BaseBlocEvent {
  final OrderType orderType;

  const ChangeOrderMethodEvent(
    this.orderType,
  );

  @override
  List<Object> get props {
    return [
      orderType,
    ];
  }
}

class ChangeSaveAddressEvent extends BaseBlocEvent {
  const ChangeSaveAddressEvent(
    this.value,
  );

  final bool value;

  @override
  List<Object> get props {
    return [
      value,
    ];
  }
}
