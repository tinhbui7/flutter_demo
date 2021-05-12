import 'package:the_coffee_house/data/models/product_model.dart';

class ProductEntity {
  int? id;
  String? name;
  double? price;
  String? image;
  String? description;

  ProductEntity({this.id, this.name, this.price, this.image, this.description});

  factory ProductEntity.fromModel(ProductModel? model) {
    return ProductEntity(
      id: model?.id,
      name: model?.name,
      price: model?.price,
      description: model?.description,
    );
  }
}
