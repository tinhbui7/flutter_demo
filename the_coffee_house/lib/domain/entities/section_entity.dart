import 'package:the_coffee_house/domain/domain.dart';

class SectionEntity {
  String? id;
  String? name;
  String? status;
  List<ProductEntity>? lstProduct;

  SectionEntity({
    this.id,
    this.name,
    this.status,
    this.lstProduct,
  });
}
