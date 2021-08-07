import 'package:the_coffee_house/data/models/size/size_model.dart';

class SizeEntity {
  String? name;
  int? extraPay;

  SizeEntity({
    this.name,
    this.extraPay,
  });

  factory SizeEntity.fromModel(SizeModel model) {
    return SizeEntity(
      name: model.name,
      extraPay: model.extraPay,
    );
  }
}
