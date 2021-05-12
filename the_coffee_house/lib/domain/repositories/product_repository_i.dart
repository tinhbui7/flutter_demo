import 'package:the_coffee_house/data/models/product_model.dart';
import 'package:the_coffee_house/domain/repositories/base_repository_i.dart';

abstract class IProductRepository extends IBaseRepository {
  Future<List<ProductModel>> getProduct();
}
