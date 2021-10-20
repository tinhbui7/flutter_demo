import 'package:the_coffee_house/domain/entities/store_entity.dart';

abstract class IStoreUseCase {
  Future<List<StoreEntity>?> getStore();
}
