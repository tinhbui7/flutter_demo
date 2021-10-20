import 'package:the_coffee_house/core/mappers/entity_mappers.dart';
import 'package:the_coffee_house/domain/entities/store_entity.dart';
import 'package:the_coffee_house/domain/repositories/stores_repository_i.dart';
import 'package:the_coffee_house/domain/usecases/base_use_case.dart';
import 'package:the_coffee_house/domain/usecases/stores/store_use_case_i.dart';

class StoreUseCase extends BaseUseCase<IStoreRepository>
    implements IStoreUseCase {
  @override
  String get tag => 'StoreUseCase';

  @override
  Future<List<StoreEntity>?> getStore() async {
    final models = await repository?.getStore();
    return EntityMappers.toListStoreEntityFromModels(models);
  }
}
