import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/delivery_entity.dart';
import 'package:the_coffee_house/domain/entities/order_entity.dart';
import 'package:the_coffee_house/domain/entities/store_entity.dart';

enum OrderType {
  DELIVERY,
  PICKUP,
}

class CartState extends BaseBlocState {
  const CartState({
    this.orderEntities = const <OrderEntity>[],
    this.deliveryEntity = const DeliveryEntity(),
    this.storeEntity = const StoreEntity(),
    this.orderType = OrderType.DELIVERY,
    this.isSaveAddress = false,
  });

  final List<OrderEntity> orderEntities;
  final DeliveryEntity deliveryEntity;
  final StoreEntity storeEntity;
  final OrderType orderType;
  final bool isSaveAddress;

  @override
  List<Object> get props {
    return [
      orderEntities,
      deliveryEntity,
      storeEntity,
      orderType,
      isSaveAddress,
    ];
  }

  CartState copyWith({
    List<OrderEntity>? orderEntities,
    DeliveryEntity? deliveryEntity,
    StoreEntity? storeEntity,
    OrderType? orderType,
    bool? isSaveAddress,
  }) {
    return CartState(
      orderEntities: orderEntities ?? this.orderEntities,
      deliveryEntity: deliveryEntity ?? this.deliveryEntity,
      storeEntity: storeEntity ?? this.storeEntity,
      orderType: orderType ?? this.orderType,
      isSaveAddress: isSaveAddress ?? this.isSaveAddress,
    );
  }
}
