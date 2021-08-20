import 'package:the_coffee_house/domain/entities/product_entity.dart';
import 'package:the_coffee_house/domain/entities/section_entity.dart';

abstract class IProductUseCase {
  Future<List<ProductEntity>?> getProduct();
  Future<List<SectionEntity>?> getListProductBySection();
}
