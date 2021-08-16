import 'package:the_coffee_house/domain/entities/size_entity.dart';
import 'package:the_coffee_house/domain/entities/topping_entity.dart';

class ProductEntity {
  String? sectionId;
  String? name;
  String? imageUrl;
  String? intro;
  List<SizeEntity>? sizes;
  List<ToppingEntity>? toppings;
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
}
