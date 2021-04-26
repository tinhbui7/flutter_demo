import 'package:domain/repositories/base_repository_i.dart';

abstract class ILocalStorageRepository extends IBaseRepository {
  Future<dynamic> set(String key, dynamic value);
  Future<dynamic> get(String key);
  Future<dynamic> delete(String key);
  Future<dynamic> clean();
}
