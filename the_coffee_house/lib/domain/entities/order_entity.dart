import 'package:the_coffee_house/domain/entities/entities.dart';

class OrderEntity {
  int? orderId;
  ProductEntity? product;
  SizeEntity? size;
  List<ToppingEntity>? topping;
  String? note;
  int? quantity;

  OrderEntity({
    this.orderId,
    this.product,
    this.size,
    this.topping,
    this.note,
    this.quantity,
  });
}
