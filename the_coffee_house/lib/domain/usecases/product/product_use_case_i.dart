import 'package:the_coffee_house/domain/entities/product_entity.dart';

abstract class IProductUseCase {
  Future<List<ProductEntity>?> getProduct();
}
