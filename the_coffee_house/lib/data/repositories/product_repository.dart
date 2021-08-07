import 'package:the_coffee_house/data/models/product/product_model.dart';
import 'package:the_coffee_house/data/repositories/base_repository.dart';
import 'package:the_coffee_house/domain/repositories/product_repository_i.dart';

class ProductRepository extends BaseRepository implements IProductRepository {
  @override
  Future<List<ProductModel>> getProduct() {
    throw UnimplementedError();
  }
}
