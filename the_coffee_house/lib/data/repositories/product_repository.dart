import 'package:the_coffee_house/data/models/product_model.dart';
import 'package:the_coffee_house/data/repositories/base_repository.dart';
import 'package:the_coffee_house/data/repositories/clients/product_client.dart';
import 'package:the_coffee_house/domain/repositories/product_repository_i.dart';

class ProductRepository extends BaseRepository<ProductClient>
    implements IProductRepository {
  ProductRepository() {
    client = ProductClient(buildDio);
  }

  @override
  Future<List<ProductModel>> getProduct() async {
    return await client.getProduct();
  }

  @override
  String get subApi => '';
}
