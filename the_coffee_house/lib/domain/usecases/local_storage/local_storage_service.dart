import 'package:the_coffee_house/domain/repositories/local_storage_repository_i.dart';
import 'package:the_coffee_house/domain/usecases/base_use_case.dart';
import 'package:the_coffee_house/domain/usecases/local_storage/local_storage_service_i.dart';

class LocalStorageService extends BaseUseCase<ILocalStorageRepository>
    implements ILocalStorageService {
  @override
  String get tag => 'LocalStorageService';

  @override
  Future clean() async => await repository?.clean();

  @override
  Future delete(String key) async => await repository?.delete(key);

  @override
  Future get(String key) async => await repository?.get(key);

  @override
  Future set(String key, value) async => await repository?.set(key, value);
}
