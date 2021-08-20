import 'package:the_coffee_house/core/mappers/entity_mappers.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';
import 'package:the_coffee_house/domain/repositories/product_repository_i.dart';
import 'package:the_coffee_house/domain/usecases/product/product_use_case_i.dart';

import '../base_use_case.dart';

class ProductUseCase extends BaseUseCase<IProductRepository>
    implements IProductUseCase {
  @override
  String get tag => 'ProductService';

  @override
  Future<List<ProductEntity>?> getProduct() async {
    final models = await repository?.getProduct();
    return EntityMappers.toListProductEntityFromModels(models);
  }

  @override
  Future<List<SectionEntity>?> getListProductBySection() async {
    final modelsSection = await sectionUseCase?.getSection();
    final modelsProduct = await repository?.getProduct();
    return EntityMappers.toListProductBySectionEntityFromModels(
        modelsProduct, modelsSection);
  }
}
