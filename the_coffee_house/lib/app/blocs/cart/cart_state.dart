import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/order_entity.dart';

class CartState extends BaseBlocState {
  final List<OrderEntity>? orderEntities;
  CartState({
    CartState? state,
    bool? isLoading,
    List<OrderEntity>? orderEntities,
  })  : orderEntities = orderEntities ?? state?.orderEntities,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
