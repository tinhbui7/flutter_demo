import 'package:the_coffee_house/data/models/product/product_model.dart';
import 'package:the_coffee_house/data/models/size/size_model.dart';
import 'package:the_coffee_house/data/models/topping/topping_model.dart';

class ProductEntity {
  String? sectionId;
  String? name;
  String? imageUrl;
  String? intro;
  List<SizeModel>? sizes;
  List<ToppingModel>? toppings;
  int? price;
  String? status;

  ProductEntity({
    this.sectionId,
    this.name,
    this.imageUrl,
    this.intro,
    this.sizes,
    this.toppings,
    this.price,
    this.status,
  });

  factory ProductEntity.fromModel(ProductModel? model) {
    return ProductEntity(
      sectionId: model?.sectionId,
      name: model?.name,
      imageUrl: model?.imageUrl,
      intro: model?.intro,
      sizes: model?.sizes,
      toppings: model?.toppings,
      price: model?.price,
      status: model?.status,
    );
  }
}
