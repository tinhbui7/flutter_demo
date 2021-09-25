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

  int get totalPayment {
    final int sum = toppingPayment.fold(
        0, (previousValue, element) => previousValue + (element.price ?? 0));
    return sizePayment + sum;
  }

  int get sizePayment {
    return (size != null)
        ? (((product?.price ?? 0) + (size?.extraPay ?? 0)) * (quantity ?? 0))
        : (product?.price ?? 0) * (quantity ?? 0);
  }

  List<ToppingPaymentEntity> get toppingPayment {
    List<ToppingPaymentEntity> _result = [];
    if (topping != null) {
      for (final element in topping!) {
        _result.add(ToppingPaymentEntity(
          name: element.name,
          price: (element.extraPay ?? 0) * (quantity ?? 0),
        ));
      }
    }
    return _result;
  }
}
