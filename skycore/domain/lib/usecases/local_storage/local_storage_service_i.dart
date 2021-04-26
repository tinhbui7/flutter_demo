abstract class ILocalStorageService {
  Future<dynamic> set(String key, dynamic value);
  Future<dynamic> get(String key);
  Future<dynamic> delete(String key);
  Future<dynamic> clean();
}
