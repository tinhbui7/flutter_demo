import 'package:domain/repositories/local_storage_repository_i.dart';
import 'package:domain/usecases/local_storage/local_storage_service_i.dart';

import '../base_service.dart';

class LocalStorageService extends BaseService<ILocalStorageRepository>
    implements ILocalStorageService {
  @override
  String get tag => 'LocalStorageService';

  @override
  Future get(String key) async {
    return await repository?.get(key);
  }

  @override
  Future set(String key, value) async {
    return await repository?.set(key, value);
  }

  @override
  Future delete(String key) async {
    return await repository?.delete(key);
  }

  @override
  Future clean() async {
    return await repository?.clean();
  }
}
