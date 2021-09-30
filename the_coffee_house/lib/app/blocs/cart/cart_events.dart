import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/domain/entities/order_entity.dart';

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
