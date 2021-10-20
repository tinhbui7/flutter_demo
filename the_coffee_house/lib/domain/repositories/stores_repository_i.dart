import 'package:the_coffee_house/data/models/store/store_model.dart';
import 'package:the_coffee_house/domain/repositories/base_repository_i.dart';

abstract class IStoreRepository extends IBaseRepository {
  Future<List<StoreModel>?> getStore();
}
