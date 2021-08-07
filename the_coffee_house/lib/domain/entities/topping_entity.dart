import 'package:the_coffee_house/data/models/topping/topping_model.dart';

class ToppingEntity {
  String? name;
  int? extraPay;

  ToppingEntity({
    this.name,
    this.extraPay,
  });

  factory ToppingEntity.fromModel(ToppingModel model) {
    return ToppingEntity(
      name: model.name,
      extraPay: model.extraPay,
    );
  }
}
