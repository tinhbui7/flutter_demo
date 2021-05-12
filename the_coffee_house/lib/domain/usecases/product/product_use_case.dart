import 'package:the_coffee_house/domain/entities/product_entity.dart';
import 'package:the_coffee_house/domain/repositories/product_repository_i.dart';
import 'package:the_coffee_house/domain/usecases/base_use_case.dart';
import 'package:the_coffee_house/domain/usecases/product/product_use_case_i.dart';

class ProductUseCase extends BaseUseCase<IProductRepository>
    implements IProductUseCase {
  String get tag => 'ProductService';

  @override
  Future<List<ProductEntity>?> getProduct() async {
    var models = await repository?.getProduct();
    return models?.map((e) => ProductEntity.fromModel(e)).toList();
  }
}
