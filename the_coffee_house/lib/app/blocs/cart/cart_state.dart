import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/delivery_entity.dart';
import 'package:the_coffee_house/domain/entities/order_entity.dart';
import 'package:the_coffee_house/domain/entities/store_entity.dart';

class CartState extends BaseBlocState {
  final List<OrderEntity>? orderEntities;
  final DeliveryEntity? deliveryEntity;
  final StoreEntity? storeEntity;
  final OrderTab? activeOrder;
  final bool? isSaveAddress;
  CartState({
    CartState? state,
    bool? isLoading,
    List<OrderEntity>? orderEntities,
    DeliveryEntity? deliveryEntity,
    StoreEntity? storeEntity,
    OrderTab? activeOrder,
    bool? isSaveAddress,
  })  : orderEntities = orderEntities ?? state?.orderEntities,
        deliveryEntity = deliveryEntity ?? state?.deliveryEntity,
        storeEntity = storeEntity ?? state?.storeEntity,
        activeOrder = activeOrder ?? state?.activeOrder,
        isSaveAddress = isSaveAddress ?? state?.isSaveAddress,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}

enum OrderTab {
  Delivery,
  Pickup,
}
